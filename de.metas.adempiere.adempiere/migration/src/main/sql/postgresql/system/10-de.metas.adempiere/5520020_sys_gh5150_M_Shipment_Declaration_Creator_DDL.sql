-- 2019-04-22T14:07:42.046
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
/* DDL */ CREATE TABLE public.M_Shipment_Declaration_Creator (AD_Client_ID NUMERIC(10) NOT NULL, AD_Org_ID NUMERIC(10) NOT NULL, C_DocType_ID NUMERIC(10), Created TIMESTAMP WITH TIME ZONE NOT NULL, CreatedBy NUMERIC(10) NOT NULL, DocumentLinesNumber NUMERIC(10) DEFAULT 0 NOT NULL, IsActive CHAR(1) CHECK (IsActive IN ('Y','N')) NOT NULL, IsOnlyNarcoticProducts CHAR(1) DEFAULT 'N' CHECK (IsOnlyNarcoticProducts IN ('Y','N')) NOT NULL, M_Shipment_Declaration_Creator_ID NUMERIC(10) NOT NULL, Updated TIMESTAMP WITH TIME ZONE NOT NULL, UpdatedBy NUMERIC(10) NOT NULL, CONSTRAINT CDocType_MShipmentDeclarationCreator FOREIGN KEY (C_DocType_ID) REFERENCES public.C_DocType DEFERRABLE INITIALLY DEFERRED, CONSTRAINT M_Shipment_Declaration_Creator_Key PRIMARY KEY (M_Shipment_Declaration_Creator_ID))
;