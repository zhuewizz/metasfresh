package de.metas.inoutcandidate.process;

import org.adempiere.ad.dao.IQueryBL;
import org.adempiere.ad.dao.impl.TypedSqlQuery;
import org.compiere.model.IQuery;

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
		final TypedSqlQuery<I_M_ShipmentSchedule> sqlSelectionQuery = TypedSqlQuery.cast(selectionQuery);
		
		final String selectionWhereClause = sqlSelectionQuery.getWhereClause();

		shipmentScheduleInvalidateRepository.invalidateSchedulesForQuery(selectionPinstanceId);

		return MSG_OK;
	}

}
