DROP FUNCTION IF EXISTS salesStatisticsThreeYears(NUMERIC, NUMERIC, NUMERIC, DATE, DATE);

CREATE OR REPLACE FUNCTION salesStatisticsThreeYears(p_AD_Client_ID NUMERIC,
                                                     p_AD_Org_ID NUMERIC,
                                                     p_C_BPartner_ID NUMERIC,
                                                     p_DateFrom DATE,
                                                     p_DateTo DATE)

    RETURNS TABLE
            (
                BPValue                 CHARACTER VARYING,
                Name                    CHARACTER VARYING,
                LifetimeValue_Before    NUMERIC,
                LifetimeValue_2YearsAgo NUMERIC,
                LifetimeValue_1YearAgo  NUMERIC,
                LifetimeValue_AtDate    NUMERIC,
                LifetimeValue_After     NUMERIC,


                Revenue                 numeric,
                ProductCosts            numeric,
                ISO_Code                character(3),
                ProductCostsPercent     numeric,

                ISO_Code                CHARACTER(3),
                SalesPercentOfTotal     NUMERIC
            )

AS
$$
DECLARE
    v_interval_before numeric;
    v_interval_after  numeric;
    i_current         integer;


BEGIN

    CREATE TEMP TABLE general_data AS
        (
            SELECT min(i.dateInvoiced) AS minDateInvoiced,
                   max(i.dateInvoiced) AS maxDateInvoiced

            FROM C_Invoice i
            WHERE i.isSOTrx = 'Y'
              AND i.DocStatus IN ('CO', 'CL')
              AND (p_C_BPartner_ID IS NULL OR p_C_BPartner_ID <= 0 OR i.C_BPartner_ID = p_C_BPartner_ID)
        );

-- CREATE TABLE creates a new, empty table.
    CREATE TABLE BP_LifetimeValue_Periods
    (
        -- Telling our new table to have one field named "id_new_num" and being of the "int8" (integer) data type.
        C_Bpartner_ID    numeric,
        Before2Years numeric,
        AfterDateTo  numeric
    );
    v_interval_before := (SELECT DATE_PART('year', p_DateFrom - INTERVAL '2 year') - DATE_PART('year', minDateInvoiced) FROM general_data);


    v_interval_before := (SELECT DATE_PART('year', maxDateInvoiced) - DATE_PART('year', p_DateTo) FROM general_data);

    i_current := 0;

    BEGIN
        WHILE i_current <= v_interval_before
            LOOP
                i_current := i_current + 1;
                -- info tidbit: in most other forms of TSQL, the colon you see above is not necessary.
                INSERT INTO BP_LifetimeValue_Periods (C_Bpartner_ID,
                                                      Before2Years,
                                                      AfterDateTo)
                SELECT bp.C_Bpartner_ID,
                       getBPOpenAmtToDate(p_AD_Client_ID := p_AD_Client_ID,
                              p_AD_Org_ID := p_AD_Org_ID,
                              p_Date := p_DateFrom - (i_current * INTERVAL '1 year'),
                              p_C_BPartner_id := bp.C_BPartner_ID,
                              p_C_Currency_ID := accounting.c_currency_id,
                              p_UseDateAcct := 'Y',
                              p_IsSOTrx := 'Y') AS Before2Years
                FROM C_BPartner bp
                    WHERE p_C_BPartner_ID;
            END LOOP;
    END;

    SELECT bp.value,
           bp.name,
--        getBPOpenAmtToDate(p_AD_Client_ID := p_AD_Client_ID,
--                           p_AD_Org_ID := p_AD_Org_ID,
--                           p_Date := p_DateFrom - INTERVAL '1 day',
--                           p_C_BPartner_id := bp.C_BPartner_ID,
--                           p_C_Currency_ID := accounting.c_currency_id,
--                           p_UseDateAcct := 'Y',
--                           p_IsSOTrx := 'Y')
--
--             AS LifetimeValue_Before,
           getBPOpenAmtToDate(p_AD_Client_ID := p_AD_Client_ID,
                              p_AD_Org_ID := p_AD_Org_ID,
                              p_Date := p_DateFrom - INTERVAL '2 year',
                              p_C_BPartner_id := bp.C_BPartner_ID,
                              p_C_Currency_ID := accounting.c_currency_id,
                              p_UseDateAcct := 'Y',
                              p_IsSOTrx := 'Y') ) AS LifetimeValue_2YearsAgo_From,

           getBPOpenAmtToDate(p_AD_Client_ID := p_AD_Client_ID,
                          p_AD_Org_ID := p_AD_Org_ID,
                          p_Date := p_DateTo - INTERVAL '2 year',
                          p_C_BPartner_id := bp.C_BPartner_ID,
                          p_C_Currency_ID := accounting.c_currency_id,
                          p_UseDateAcct := 'Y',
                          p_IsSOTrx := 'Y')

           ) AS LifetimeValue_2YearsAgo_To,

getBPOpenAmtToDate(p_AD_Client_ID := p_AD_Client_ID,
                          p_AD_Org_ID := p_AD_Org_ID,
                          p_Date := p_DateFrom - INTERVAL '1 year',
                          p_C_BPartner_id := bp.C_BPartner_ID,
                          p_C_Currency_ID := accounting.c_currency_id,
                          p_UseDateAcct := 'Y',
                          p_IsSOTrx := 'Y') LifetimeValue_1YearAgo_From,

getBPOpenAmtToDate(p_AD_Client_ID := p_AD_Client_ID,
                          p_AD_Org_ID := p_AD_Org_ID,
                          p_Date := p_DateFrom - INTERVAL '1 year',
                          p_C_BPartner_id := bp.C_BPartner_ID,
                          p_C_Currency_ID := accounting.c_currency_id,
                          p_UseDateAcct := 'Y',
                          p_IsSOTrx := 'Y') LifetimeValue_1YearAgo_From,


    FROM C_BPartner bp;

END
$$
    LANGUAGE plpgsql VOLATILE;



COMMENT ON FUNCTION CustomersTopRevenue(NUMERIC, NUMERIC, DATE, DATE, INTEGER) IS
    '  TEST
    SELECT *
    FROM CustomersTopRevenue
        (p_AD_Client_ID := 1000000,
         p_AD_Org_ID := 1000000,
         p_DateFrom := ''2020-01-01'',
         p_DateTo := ''2020-05-05'',
         p_Limit := -1); ';


/* TEST:

 SELECT *
    FROM CustomersTopRevenue
        (p_AD_Client_ID := 1000000,
         p_AD_Org_ID := 1000000,
         p_DateFrom := '2020-01-01',
         p_DateTo := '2020-05-05',
         p_Limit := -1);

*/