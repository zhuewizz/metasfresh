import { salesOrders } from '../../page_objects/sales_orders';
import { BPartner } from '../../support/utils/bpartner';
import { DiscountSchema } from '../../support/utils/discountschema';
import { Bank } from '../../support/utils/bank';
import { Builder } from '../../support/utils/builder';

describe('Create Sales order', function() {
  const timestamp = new Date().getTime();
  const customer = `CustomerTest ${timestamp}`;
  const productName = `ProductTest ${timestamp}`;
  const productValue = `sales_order_test ${timestamp}`;
  const productCategoryName = `ProductCategoryName ${timestamp}`;
  const productCategoryValue = `ProductCategoryValue ${timestamp}`;
  const discountSchemaName = `DiscountSchemaTest ${timestamp}`;
  const priceSystemName = `PriceSystem ${timestamp}`;
  const priceListName = `PriceList ${timestamp}`;
  const priceListVersionName = `PriceListVersion ${timestamp}`;
  const productType = 'Item';

  before(function() {
    Builder.createBasicPriceEntities(priceSystemName, priceListVersionName, priceListName, true);
    Builder.createBasicProductEntities(
      productCategoryName,
      productCategoryValue,
      priceListName,
      productName,
      productValue,
      productType
    );

    cy.fixture('discount/discountschema.json').then(discountSchemaJson => {
      Object.assign(new DiscountSchema(), discountSchemaJson)
        .setName(discountSchemaName)
        .apply();
    });

    cy.fixture('finance/bank.json').then(productJson => {
      Object.assign(new Bank(), productJson).apply();
    });

    cy.fixture('sales/simple_customer.json').then(customerJson => {
      new BPartner({ ...customerJson, name: customer }).setCustomerDiscountSchema(discountSchemaName).apply();
    });

    cy.readAllNotifications();
  });
  it('Create a sales order', function() {
    cy.visitWindow('143', 'NEW');
    cy.get('#lookup_C_BPartner_ID input')
      .type(customer)
      .type('\n');
    cy.contains('.input-dropdown-list-option', customer).click();

    cy.selectInListField('M_PricingSystem_ID', priceSystemName);
    const addNewText = Cypress.messages.window.batchEntry.caption;
    cy.get('.tabs-wrapper .form-flex-align .btn')
      .contains(addNewText)
      .should('exist')
      .click();
    cy.wait(8000);
    cy.get('.quick-input-container .form-group').should('exist');
    cy.writeIntoLookupListField('M_Product_ID', `${timestamp}`, productName);

    cy.get('.form-field-Qty')
      .click()
      .find('.input-body-container.focused')
      .should('exist')
      .find('i')
      .eq(0)
      .click();
    cy.server();
    cy.route('POST', `/rest/api/window/${salesOrders.windowId}/*/${salesOrders.orderLineTabId}/quickInput`).as(
      'resetQuickInputFields'
    );
    cy.get('.form-field-Qty')
      .find('input')
      .should('have.value', '0.1')
      .type('1{enter}');
    cy.wait(3000);
    /**Complete sales order */
    cy.get('.form-field-DocAction ul')
      .click({ force: true })
      .get('li')
      .eq('1')
      .click({ force: true });
    cy.wait(8000);
    cy.get('.btn-header.side-panel-toggle').click({ force: true });
    cy.get('.order-list-nav .order-list-btn')
      .eq('1')
      .find('i')
      .click({ force: true });
    /** Go to Shipment disposition*/
    cy.get('.reference_M_ShipmentSchedule').click();
    cy.get('tbody tr')
      .eq('0')
      .dblclick();
    /**Change shipment date */

    cy.selectOffsetDateViaPicker('DeliveryDate_Override', 1);
    cy.selectOffsetDateViaPicker('PreparationDate_Override', 1);

    var nextDay = new Date();
    nextDay.setDate(nextDay.getDate() + 1);
    let nextDayAsString = nextDay.toLocaleDateString('en-US', { year: 'numeric', month: '2-digit', day: '2-digit' });

    cy.get(
      '.form-field-DeliveryDate_Effective, .form-field-DeliveryDate_Override, .form-field-PreparationDate_Effective, .form-field-PreparationDate_Override'
    )
      .find('input')
      .should(input => {
        expect(input.val()).to.have.string(nextDayAsString);
      });
  });
});
