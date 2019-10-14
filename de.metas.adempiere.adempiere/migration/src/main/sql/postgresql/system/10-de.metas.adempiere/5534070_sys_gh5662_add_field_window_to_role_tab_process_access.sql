-- 2019-10-14T08:49:58.561Z
-- URL zum Konzept
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DDL_NoForeignKey,Description,EntityType,FieldLength,Help,IsActive,IsAdvancedText,IsAllowLogging,IsAlwaysUpdateable,IsAutoApplyValidationRule,IsAutocomplete,IsCalculated,IsDimension,IsDLMPartitionBoundary,IsEncrypted,IsForceIncludeInGeneratedModel,IsGenericZoomKeyColumn,IsGenericZoomOrigin,IsIdentifier,IsKey,IsLazyLoading,IsMandatory,IsParent,IsRangeFilter,IsSelectionColumn,IsShowFilterIncrementButtons,IsStaleable,IsSyncDatabase,IsTranslated,IsUpdateable,IsUseDocSequence,Name,SelectionColumnSeqNo,SeqNo,Updated,UpdatedBy,Version) VALUES (0,569200,143,0,30,284,197,'AD_Window_ID',TO_TIMESTAMP('2019-10-14 10:49:58','YYYY-MM-DD HH24:MI:SS'),100,'N','Eingabe- oder Anzeige-Fenster','D',10,'Das Feld "Fenster" identifiziert ein bestimmtes Fenster im system.','Y','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','Fenster',0,0,TO_TIMESTAMP('2019-10-14 10:49:58','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 2019-10-14T08:49:58.565Z
-- URL zum Konzept
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language, t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N') AND t.AD_Column_ID=569200 AND NOT EXISTS (SELECT 1 FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 2019-10-14T08:49:58.613Z
-- URL zum Konzept
/* DDL */  select update_Column_Translation_From_AD_Element(143) 
;

-- 2019-10-14T08:50:01.018Z
-- URL zum Konzept
/* DDL */ SELECT public.db_alter_table('AD_Process_Access','ALTER TABLE public.AD_Process_Access ADD COLUMN AD_Window_ID NUMERIC(10)')
;

-- 2019-10-14T08:50:01.055Z
-- URL zum Konzept
ALTER TABLE AD_Process_Access ADD CONSTRAINT ADWindow_ADProcessAccess FOREIGN KEY (AD_Window_ID) REFERENCES public.AD_Window DEFERRABLE INITIALLY DEFERRED
;

-- 2019-10-14T08:50:13.166Z
-- URL zum Konzept
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,ColumnDisplayLength,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IncludedTabHeight,IsActive,IsDisplayed,IsDisplayedGrid,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SeqNoGrid,SortNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (0,569200,589579,0,305,0,TO_TIMESTAMP('2019-10-14 10:50:13','YYYY-MM-DD HH24:MI:SS'),100,'Eingabe- oder Anzeige-Fenster',0,'U','Das Feld "Fenster" identifiziert ein bestimmtes Fenster im system.',0,'Y','Y','Y','N','N','N','N','N','Fenster',70,70,0,1,1,TO_TIMESTAMP('2019-10-14 10:50:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-10-14T08:50:13.171Z
-- URL zum Konzept
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language, t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N') AND t.AD_Field_ID=589579 AND NOT EXISTS (SELECT 1 FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 2019-10-14T08:50:13.178Z
-- URL zum Konzept
/* DDL */  select update_FieldTranslation_From_AD_Name_Element(143) 
;

-- 2019-10-14T08:50:13.239Z
-- URL zum Konzept
DELETE FROM AD_Element_Link WHERE AD_Field_ID=589579
;

-- 2019-10-14T08:50:13.243Z
-- URL zum Konzept
/* DDL */ select AD_Element_Link_Create_Missing_Field(589579)
;

-- 2019-10-14T08:51:13.257Z
-- URL zum Konzept
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,AD_UI_ElementType,Created,CreatedBy,IsActive,IsAdvancedField,IsAllowFiltering,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,IsMultiLine,MultiLine_LinesCount,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,589579,0,305,540234,563240,'F',TO_TIMESTAMP('2019-10-14 10:51:13','YYYY-MM-DD HH24:MI:SS'),100,'Y','N','N','Y','N','N','N',0,'Fenster',5,0,0,TO_TIMESTAMP('2019-10-14 10:51:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-10-14T08:53:58.109Z
-- URL zum Konzept
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) VALUES (0,0,540465,TO_TIMESTAMP('2019-10-14 10:53:58','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','AD_Window Process Filter','S',TO_TIMESTAMP('2019-10-14 10:53:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-10-14T09:03:23.598Z
-- URL zum Konzept
UPDATE AD_Column SET AD_Val_Rule_ID=540465, IsUpdateable='N',Updated=TO_TIMESTAMP('2019-10-14 11:03:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=4633
;

-- 2019-10-14T09:03:27.753Z
-- URL zum Konzept
UPDATE AD_Column SET IsAutoApplyValidationRule='Y', IsUpdateable='N',Updated=TO_TIMESTAMP('2019-10-14 11:03:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=4633
;


-- 2019-10-14T09:13:43.808Z
-- URL zum Konzept
UPDATE AD_Val_Rule SET Code='exists ( select atp.ad_process_id
                                            from ad_window w
                                                     join ad_tab a on w.ad_window_id = a.ad_window_id and a.isactive = ''Y''
                                                     join ad_table_process atp
                                                          on atp.isactive = ''Y'' and a.ad_table_id = atp.ad_table_id
                                                     left join ad_process p ON atp.ad_process_id = p.ad_process_id
                                            where case when @AD_Window_ID@ =0 then atp.ad_process_id = ad_process.ad_process_id else (w.ad_window_id = @AD_Window_ID@ and atp.ad_process_id = ad_process.ad_process_id) end  )',Updated=TO_TIMESTAMP('2019-10-14 11:13:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=540465
;

-- 2019-10-14T09:16:27.055Z
-- URL zum Konzept
UPDATE AD_Column SET IsUpdateable='N', Version=2.000000000000,Updated=TO_TIMESTAMP('2019-10-14 11:16:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=155
;

-- 2019-10-14T09:16:32.403Z
-- URL zum Konzept
UPDATE AD_Column SET SeqNo=3,Updated=TO_TIMESTAMP('2019-10-14 11:16:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=156
;

-- 2019-10-14T09:16:43.994Z
-- URL zum Konzept
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N', SeqNo=1,Updated=TO_TIMESTAMP('2019-10-14 11:16:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=155
;

-- 2019-10-14T09:16:45.524Z
-- URL zum Konzept
UPDATE AD_Column SET SeqNo=2,Updated=TO_TIMESTAMP('2019-10-14 11:16:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=156
;

-- 2019-10-14T09:18:18.593Z
-- URL zum Konzept
UPDATE AD_Column SET AD_Reference_Value_ID=NULL,Updated=TO_TIMESTAMP('2019-10-14 11:18:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=569200
;

-- 2019-10-14T09:20:12.079Z
-- URL zum Konzept
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,577214,0,TO_TIMESTAMP('2019-10-14 11:20:12','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','Optional Filter by Window','Optional Filter by Window',TO_TIMESTAMP('2019-10-14 11:20:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-10-14T09:20:12.081Z
-- URL zum Konzept
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, CommitWarning,Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language, t.AD_Element_ID, t.CommitWarning,t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' OR l.IsBaseLanguage='Y') AND t.AD_Element_ID=577214 AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 2019-10-14T09:20:26.205Z
-- URL zum Konzept
UPDATE AD_Field SET AD_Name_ID=577214, Description=NULL, Help=NULL, Name='Optional Filter by Window',Updated=TO_TIMESTAMP('2019-10-14 11:20:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=589579
;

-- 2019-10-14T09:20:26.206Z
-- URL zum Konzept
/* DDL */  select update_FieldTranslation_From_AD_Name_Element(577214) 
;

-- 2019-10-14T09:20:26.209Z
-- URL zum Konzept
DELETE FROM AD_Element_Link WHERE AD_Field_ID=589579
;

-- 2019-10-14T09:20:26.209Z
-- URL zum Konzept
/* DDL */ select AD_Element_Link_Create_Missing_Field(589579)
;


--Renaming Translation of Optional Filter Window


-- 2019-10-14T20:09:50.052Z
-- URL zum Konzept
UPDATE AD_Element_Trl SET Name='Optionaler Fensterfilter', PrintName='Optionaler Fensterfilter',Updated=TO_TIMESTAMP('2019-10-14 22:09:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=577214 AND AD_Language='de_CH'
;

-- 2019-10-14T20:09:50.057Z
-- URL zum Konzept
/* DDL */  select update_TRL_Tables_On_AD_Element_TRL_Update(577214,'de_CH') 
;

-- 2019-10-14T20:09:55.384Z
-- URL zum Konzept
UPDATE AD_Element_Trl SET Name='Optionaler Fensterfilter', PrintName='Optionaler Fensterfilter',Updated=TO_TIMESTAMP('2019-10-14 22:09:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=577214 AND AD_Language='de_DE'
;

-- 2019-10-14T20:09:55.386Z
-- URL zum Konzept
/* DDL */  select update_TRL_Tables_On_AD_Element_TRL_Update(577214,'de_DE') 
;

-- 2019-10-14T20:09:55.425Z
-- URL zum Konzept
/* DDL */  select update_ad_element_on_ad_element_trl_update(577214,'de_DE') 
;

-- 2019-10-14T20:09:55.437Z
-- URL zum Konzept
UPDATE AD_Column SET ColumnName=NULL, Name='Optionaler Fensterfilter', Description=NULL, Help=NULL WHERE AD_Element_ID=577214
;

-- 2019-10-14T20:09:55.439Z
-- URL zum Konzept
UPDATE AD_Process_Para SET ColumnName=NULL, Name='Optionaler Fensterfilter', Description=NULL, Help=NULL WHERE AD_Element_ID=577214 AND IsCentrallyMaintained='Y'
;

-- 2019-10-14T20:09:55.440Z
-- URL zum Konzept
UPDATE AD_Field SET Name='Optionaler Fensterfilter', Description=NULL, Help=NULL WHERE (AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=577214) AND AD_Name_ID IS NULL ) OR (AD_Name_ID = 577214)
;

-- 2019-10-14T20:09:55.681Z
-- URL zum Konzept
UPDATE AD_PrintFormatItem pi SET PrintName='Optionaler Fensterfilter', Name='Optionaler Fensterfilter' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c  WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=577214)
;

-- 2019-10-14T20:09:55.683Z
-- URL zum Konzept
UPDATE AD_Tab SET Name='Optionaler Fensterfilter', Description=NULL, Help=NULL, CommitWarning = NULL WHERE AD_Element_ID = 577214
;

-- 2019-10-14T20:09:55.685Z
-- URL zum Konzept
UPDATE AD_WINDOW SET Name='Optionaler Fensterfilter', Description=NULL, Help=NULL WHERE AD_Element_ID = 577214
;

-- 2019-10-14T20:09:55.686Z
-- URL zum Konzept
UPDATE AD_Menu SET   Name = 'Optionaler Fensterfilter', Description = NULL, WEBUI_NameBrowse = NULL, WEBUI_NameNew = NULL, WEBUI_NameNewBreadcrumb = NULL WHERE AD_Element_ID = 577214
;

-- 2019-10-14T20:12:13.397Z
-- Making Optional Window Filter first Field
UPDATE AD_UI_Element SET SeqNo=5,Updated=TO_TIMESTAMP('2019-10-14 22:12:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=563240
;


-- 2019-10-14T09:29:35.447Z
-- move tab Doc Action Access next to Process Access
UPDATE AD_Tab SET SeqNo=55,Updated=TO_TIMESTAMP('2019-10-14 11:29:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53013
;
