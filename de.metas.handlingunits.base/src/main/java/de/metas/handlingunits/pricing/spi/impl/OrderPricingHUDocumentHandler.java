package de.metas.handlingunits.pricing.spi.impl;

import org.adempiere.model.InterfaceWrapperHelper;
import org.compiere.model.I_M_PriceList_Version;

import de.metas.adempiere.model.I_C_Order;
import de.metas.handlingunits.IHUDocumentHandler;
import de.metas.handlingunits.model.I_M_HU_PI_Item_Product;
import de.metas.handlingunits.model.I_M_ProductPrice;
import de.metas.order.IOrderBL;
import de.metas.pricing.service.ProductPrices;
import de.metas.product.ProductId;
import de.metas.util.Check;
import de.metas.util.Services;

public class OrderPricingHUDocumentHandler implements IHUDocumentHandler
{
	/**
	 * Suggests the {@link I_M_HU_PI_Item_Product} for Order Quick Input
	 */
	@Override
	public I_M_HU_PI_Item_Product getM_HU_PI_ItemProductFor(final Object orderObj, final ProductId productId)
	{
		Check.assumeInstanceOf(orderObj, I_C_Order.class, "orderObj not null");
		final I_C_Order order = InterfaceWrapperHelper.create(orderObj, I_C_Order.class);
		final I_M_PriceList_Version plv = Services.get(IOrderBL.class).getPriceListVersion(order);

		final boolean strictDefault = false;
		final I_M_ProductPrice productPrice = ProductPrices.newQuery(plv)
				.setProductId(productId)
				.onlyAttributePricing()
				.retrieveDefault(strictDefault, I_M_ProductPrice.class);
		
		if(productPrice != null)
		{
			return productPrice.getM_HU_PI_Item_Product();
		}

		return null;
	}

	@Override
	public void applyChangesFor(final Object document)
	{
		// Nothing to do for order.
	}
}
