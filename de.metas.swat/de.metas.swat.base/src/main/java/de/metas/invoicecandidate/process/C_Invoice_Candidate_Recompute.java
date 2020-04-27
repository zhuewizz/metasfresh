package de.metas.invoicecandidate.process;

import org.adempiere.ad.dao.IQueryBL;
import org.adempiere.ad.dao.IQueryFilter;
import org.compiere.model.IQuery;

import de.metas.inoutcandidate.model.I_M_ShipmentSchedule;
import de.metas.invoicecandidate.api.IInvoiceCandDAO;
import de.metas.invoicecandidate.model.I_C_Invoice_Candidate;
import de.metas.process.IProcessPrecondition;
import de.metas.process.IProcessPreconditionsContext;
import de.metas.process.JavaProcess;
import de.metas.process.ProcessPreconditionsResolution;
import de.metas.util.Services;
import lombok.NonNull;

public class C_Invoice_Candidate_Recompute extends JavaProcess implements IProcessPrecondition
{
	final IInvoiceCandDAO invCandDao = Services.get(IInvoiceCandDAO.class);

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
		final IQueryFilter<I_C_Invoice_Candidate> queryFilterOrElseFalse = getProcessInfo().getQueryFilterOrElseFalse();

		final IQuery<I_C_Invoice_Candidate> query = Services.get(IQueryBL.class).createQueryBuilder(I_C_Invoice_Candidate.class)
				.filter(queryFilterOrElseFalse)
				.create();

		invCandDao.invalidateCandsFor(query);

		return MSG_OK;
	}

}
