package de.metas.inoutcandidate.process;

import java.util.Optional;

import org.adempiere.ad.dao.IQueryBL;
import org.adempiere.ad.dao.IQueryFilter;
import org.adempiere.ad.dao.impl.TypedSqlQuery;
import org.adempiere.ad.trx.api.ITrx;
import org.compiere.model.IQuery;
import org.compiere.util.DB;

import de.metas.inoutcandidate.async.UpdateInvalidShipmentSchedulesWorkpackageProcessor;
import de.metas.inoutcandidate.invalidation.IShipmentScheduleInvalidateRepository;
import de.metas.inoutcandidate.model.I_M_ShipmentSchedule;
import de.metas.process.IProcessPrecondition;
import de.metas.process.IProcessPreconditionsContext;
import de.metas.process.JavaProcess;
import de.metas.process.PInstanceId;
import de.metas.process.ProcessPreconditionsResolution;
import de.metas.util.Services;
import lombok.NonNull;

public class M_ShipmentSchedule_Recompute extends JavaProcess implements IProcessPrecondition
{
	private final IShipmentScheduleInvalidateRepository shipmentScheduleInvalidateRepository = Services.get(IShipmentScheduleInvalidateRepository.class);

	@Override
	public ProcessPreconditionsResolution checkPreconditionsApplicable(@NonNull final IProcessPreconditionsContext context)
	{
		if (context.isNoSelection())
		{
			return ProcessPreconditionsResolution.rejectBecauseNoSelection();
		}

		return ProcessPreconditionsResolution.accept();
	}

	@Override
	protected String doIt() throws Exception
	{
		final PInstanceId selectionPinstanceId = Services.get(IQueryBL.class)
				.createQueryBuilder(I_M_ShipmentSchedule.class)
				.filter(getProcessInfo().getQueryFilterOrElseFalse())
				.create()
				.createSelection();
		
		final IQuery<I_M_ShipmentSchedule> selectionQuery = Services.get(IQueryBL.class)
				.createQueryBuilder(I_M_ShipmentSchedule.class)
				.setOnlySelection(selectionPinstanceId).create();
		
		PInstanceId pinstanceId = getProcessInfo().getPinstanceId();
	//	final TypedSqlQuery<I_M_ShipmentSchedule> sqlSelectionQuery = TypedSqlQuery.cast((IQuery<I_M_ShipmentSchedule>)getProcessInfo().getQueryFilterOrElseFalse());
//		
//		System.out.println(sqlSelectionQuery.getWhereClause());
//		final String selectionWhereClause = sqlSelectionQuery.getWhereClause();
//		
//		sqlSelectionQuery.getWhereClause();
		
		
//		final ICompositeQueryFilter<I_M_ShipmentSchedule> filter = Services.get(IQueryBL.class).createCompositeQueryFilter(I_M_ShipmentSchedule.class)
//				.addFilter(shipmentScheduleQuery);
//		
//		
//
		IQuery<I_M_ShipmentSchedule> query = Services.get(IQueryBL.class).createQueryBuilder(I_M_ShipmentSchedule.class)
				.setOnlySelection(pinstanceId)
				.create();
//
		final TypedSqlQuery<I_M_ShipmentSchedule> sqlSelectionQuery1 = TypedSqlQuery.cast(selectionQuery);
//
		final TypedSqlQuery<I_M_ShipmentSchedule> sqlSelectionQuery2 = TypedSqlQuery.cast(query);
		final String selectionWhereClause1 = sqlSelectionQuery1.getWhereClause();
		final String selectionWhereClause2 = sqlSelectionQuery2.getWhereClause();
//
//		final String sql = "INSERT INTO " + "M_SHIPMENT_SCHEDULE_RECOMPUTE" + " (M_ShipmentSchedule_ID, Description) "
//				+ "\n SELECT " + I_M_ShipmentSchedule.COLUMNNAME_M_ShipmentSchedule_ID + ", ?"
//				+ "\n FROM " + I_M_ShipmentSchedule.Table_Name
//				+ "\n WHERE " + I_M_ShipmentSchedule.COLUMNNAME_Processed + "='N'"
//				+ "\n AND "
////				+ selectionWhereClause;
////
////		final int count = DB.executeUpdateEx(sql, new Object[] { sqlSelectionQuery }, ITrx.TRXNAME_ThreadInherited);
//	//	logger.debug("Invalidated {} M_ShipmentSchedules for Query", count, sqlSelectionQuery);
//		//
//		if (count > 0)
//		{
//			UpdateInvalidShipmentSchedulesWorkpackageProcessor.schedule();
//		}

		shipmentScheduleInvalidateRepository.invalidateSchedulesForQueryFilter(getProcessInfo().getQueryFilterOrElseFalse());

		return MSG_OK;
	}

}
