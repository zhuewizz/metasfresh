package de.metas.vertical.healthcare_ch.forum_datenaustausch_ch.invoice_xversion.model.payload.body.treatment;

import lombok.Builder;
import lombok.NonNull;
import lombok.Singular;
import lombok.Value;

import java.util.List;

import javax.xml.datatype.Duration;
import javax.xml.datatype.XMLGregorianCalendar;

/*
 * #%L
 * vertical-healthcare_ch.invoice_gateway.forum_datenaustausch_ch.invoice_commons
 * %%
 * Copyright (C) 2018 metas GmbH
 * %%
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program. If not, see
 * <http://www.gnu.org/licenses/gpl-2.0.html>.
 * #L%
 */

@Value
@Builder
public class XmlXtraStationary
{
	XMLGregorianCalendar hospitalizationDate;

	Duration treatmentDays;

	String hospitalizationType;

	String hospitalizationMode;

	String clazz;

	String sectionMajor;

	Boolean hasExpenseLoading;

	Boolean doCostAssessment;

	@NonNull
	XmlGrouperData admissionType;

	@NonNull
	XmlGrouperData dischargeType;

	@NonNull
	XmlGrouperData providerType;

	@NonNull
	XmlBfsData bfsResidenceBeforeAdmission;

	@NonNull
	XmlBfsData bfsAdmissionType;

	@NonNull
	XmlBfsData bfsDecisionForDischarge;

	@NonNull
	XmlBfsData bfsResidenceAfterDischarge;

	@Singular
	List<XmlCaseDetail> caseDetails;
}