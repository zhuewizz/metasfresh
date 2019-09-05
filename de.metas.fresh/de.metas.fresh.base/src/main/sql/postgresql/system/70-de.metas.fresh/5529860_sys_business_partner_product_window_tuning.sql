-- 2019-09-04T22:09:30.191
-- URL zum Konzept
UPDATE AD_UI_Element SET IsDisplayedGrid='Y', SeqNoGrid=10,Updated=TO_TIMESTAMP('2019-09-04 22:09:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560409
;

-- 2019-09-04T22:09:30.194
-- URL zum Konzept
UPDATE AD_UI_Element SET IsDisplayedGrid='Y', SeqNoGrid=20,Updated=TO_TIMESTAMP('2019-09-04 22:09:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560440
;

-- 2019-09-04T22:09:30.195
-- URL zum Konzept
UPDATE AD_UI_Element SET IsDisplayedGrid='Y', SeqNoGrid=30,Updated=TO_TIMESTAMP('2019-09-04 22:09:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560417
;

-- 2019-09-04T22:09:30.197
-- URL zum Konzept
UPDATE AD_UI_Element SET IsDisplayedGrid='Y', SeqNoGrid=40,Updated=TO_TIMESTAMP('2019-09-04 22:09:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560416
;

-- 2019-09-04T22:09:30.198
-- URL zum Konzept
UPDATE AD_UI_Element SET IsDisplayedGrid='Y', SeqNoGrid=50,Updated=TO_TIMESTAMP('2019-09-04 22:09:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560439
;

-- 2019-09-04T22:10:44.244
-- URL zum Konzept
INSERT INTO AD_Tab (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,AllowQuickInput,Created,CreatedBy,EntityType,HasTree,ImportFields,IsActive,IsAdvancedTab,IsCheckParentsChanged,IsGenericZoomTarget,IsGridModeOnly,IsInfoTab,IsInsertRecord,IsQueryOnLoad,IsReadOnly,IsRefreshAllOnActivate,IsRefreshViewOnChangeEvents,IsSearchActive,IsSearchCollapsed,IsSingleRow,IsSortTab,IsTranslationTab,MaxQueryRecords,Name,Processing,SeqNo,TabLevel,Template_Tab_ID,Updated,UpdatedBy) VALUES (0,1416,0,541864,251,540672,'Y',TO_TIMESTAMP('2019-09-04 22:10:44','YYYY-MM-DD HH24:MI:SS'),100,'U','N','N','Y','N','Y','N','N','N','Y','Y','N','N','N','Y','Y','N','N','N',0,'Preis','N',20,1,541593,TO_TIMESTAMP('2019-09-04 22:10:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-09-04T22:10:44.245
-- URL zum Konzept
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language, t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N') AND t.AD_Tab_ID=541864 AND NOT EXISTS (SELECT 1 FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 2019-09-04T22:10:56.230
-- URL zum Konzept
UPDATE AD_Tab SET AD_Column_ID=2064,Updated=TO_TIMESTAMP('2019-09-04 22:10:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=541864
;

-- 2019-09-04T22:13:09.608
-- URL zum Konzept
UPDATE AD_Tab SET Parent_Column_ID=10171,Updated=TO_TIMESTAMP('2019-09-04 22:13:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=541864
;

-- 2019-09-04T22:14:41.625
-- URL zum Konzept
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2019-09-04 22:14:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=568569
;

-- 2019-09-04T22:15:34.038
-- URL zum Konzept
UPDATE AD_Column SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2019-09-04 22:15:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=568569
;

-- 2019-09-04T22:17:13.227
-- URL zum Konzept
INSERT INTO AD_UI_Section (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy,Value) VALUES (0,0,541841,541418,TO_TIMESTAMP('2019-09-04 22:17:13','YYYY-MM-DD HH24:MI:SS'),100,'Y',20,TO_TIMESTAMP('2019-09-04 22:17:13','YYYY-MM-DD HH24:MI:SS'),100,'advanced edit')
;

-- 2019-09-04T22:17:13.228
-- URL zum Konzept
INSERT INTO AD_UI_Section_Trl (AD_Language,AD_UI_Section_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language, t.AD_UI_Section_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_UI_Section t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N') AND t.AD_UI_Section_ID=541418 AND NOT EXISTS (SELECT 1 FROM AD_UI_Section_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_UI_Section_ID=t.AD_UI_Section_ID)
;

-- 2019-09-04T22:17:49.593
-- URL zum Konzept
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,Updated,UpdatedBy) VALUES (0,0,541792,542747,TO_TIMESTAMP('2019-09-04 22:17:49','YYYY-MM-DD HH24:MI:SS'),100,'Y','d',5,TO_TIMESTAMP('2019-09-04 22:17:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-09-04T22:17:57.375
-- URL zum Konzept
UPDATE AD_UI_ElementGroup SET Name='second', UIStyle='',Updated=TO_TIMESTAMP('2019-09-04 22:17:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_ElementGroup_ID=542712
;

-- 2019-09-04T22:18:02.796
-- URL zum Konzept
UPDATE AD_UI_ElementGroup SET Name='default', UIStyle='primary',Updated=TO_TIMESTAMP('2019-09-04 22:18:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_ElementGroup_ID=542747
;

-- 2019-09-04T22:18:20.859
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542747, SeqNo=10,Updated=TO_TIMESTAMP('2019-09-04 22:18:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560440
;

-- 2019-09-04T22:18:35.561
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542747, SeqNo=20,Updated=TO_TIMESTAMP('2019-09-04 22:18:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560409
;

-- 2019-09-04T22:18:45.305
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542747, SeqNo=30,Updated=TO_TIMESTAMP('2019-09-04 22:18:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560417
;

-- 2019-09-04T22:19:28.069
-- URL zum Konzept
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,Updated,UpdatedBy) VALUES (0,0,541793,542748,TO_TIMESTAMP('2019-09-04 22:19:28','YYYY-MM-DD HH24:MI:SS'),100,'Y','active',10,TO_TIMESTAMP('2019-09-04 22:19:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-09-04T22:19:32.087
-- URL zum Konzept
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,Updated,UpdatedBy) VALUES (0,0,541793,542749,TO_TIMESTAMP('2019-09-04 22:19:32','YYYY-MM-DD HH24:MI:SS'),100,'Y','misc',20,TO_TIMESTAMP('2019-09-04 22:19:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-09-04T22:19:35.725
-- URL zum Konzept
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,Updated,UpdatedBy) VALUES (0,0,541793,542750,TO_TIMESTAMP('2019-09-04 22:19:35','YYYY-MM-DD HH24:MI:SS'),100,'Y','org',30,TO_TIMESTAMP('2019-09-04 22:19:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2019-09-04T22:21:57.304
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542748, SeqNo=10,Updated=TO_TIMESTAMP('2019-09-04 22:21:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560416
;

-- 2019-09-04T22:22:13.568
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542750, SeqNo=10,Updated=TO_TIMESTAMP('2019-09-04 22:22:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560415
;

-- 2019-09-04T22:22:24.459
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542750, SeqNo=20,Updated=TO_TIMESTAMP('2019-09-04 22:22:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560411
;

-- 2019-09-04T22:22:33.596
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560414
;

-- 2019-09-04T22:22:34.492
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560408
;

-- 2019-09-04T22:22:35.830
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560407
;

-- 2019-09-04T22:22:37.154
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560410
;

-- 2019-09-04T22:22:38.431
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560412
;

-- 2019-09-04T22:22:56.612
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560437
;

-- 2019-09-04T22:22:57.269
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560438
;

-- 2019-09-04T22:22:59.989
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:22:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560439
;

-- 2019-09-04T22:23:03.350
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:23:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560434
;

-- 2019-09-04T22:23:07.632
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:23:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560433
;

-- 2019-09-04T22:23:08.847
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:23:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560432
;

-- 2019-09-04T22:23:10.870
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:23:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560431
;

-- 2019-09-04T22:23:21.286
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:23:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560426
;

-- 2019-09-04T22:24:26.936
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:24:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560418
;

-- 2019-09-04T22:24:29.338
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:24:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560419
;

-- 2019-09-04T22:30:29.346
-- URL zum Konzept
UPDATE AD_Field SET IsActive='N', IsDisplayed='N',Updated=TO_TIMESTAMP('2019-09-04 22:30:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=582615
;

-- 2019-09-04T22:30:43.296
-- URL zum Konzept
DELETE FROM AD_UI_Element WHERE AD_UI_Element_ID=560422
;

-- 2019-09-04T22:30:51.498
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:30:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560420
;

-- 2019-09-04T22:30:59.349
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:30:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560435
;

-- 2019-09-04T22:31:00.778
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:31:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560436
;

-- 2019-09-04T22:31:32.156
-- URL zum Konzept
UPDATE AD_UI_Element SET IsActive='N',Updated=TO_TIMESTAMP('2019-09-04 22:31:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560421
;

-- 2019-09-04T22:32:05.535
-- URL zum Konzept
UPDATE AD_UI_Element SET SeqNo=10,Updated=TO_TIMESTAMP('2019-09-04 22:32:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560423
;

-- 2019-09-04T22:32:10.917
-- URL zum Konzept
UPDATE AD_UI_Element SET SeqNo=20,Updated=TO_TIMESTAMP('2019-09-04 22:32:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560424
;

-- 2019-09-04T22:32:13.344
-- URL zum Konzept
UPDATE AD_UI_Element SET SeqNo=30,Updated=TO_TIMESTAMP('2019-09-04 22:32:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560425
;

-- 2019-09-04T22:32:25.285
-- URL zum Konzept
UPDATE AD_UI_Element SET SeqNo=1,Updated=TO_TIMESTAMP('2019-09-04 22:32:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560428
;

-- 2019-09-04T22:32:29.173
-- URL zum Konzept
UPDATE AD_UI_Element SET SeqNo=2,Updated=TO_TIMESTAMP('2019-09-04 22:32:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560429
;

-- 2019-09-04T22:32:31.420
-- URL zum Konzept
UPDATE AD_UI_Element SET SeqNo=3,Updated=TO_TIMESTAMP('2019-09-04 22:32:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560430
;

-- 2019-09-05T08:00:59.341
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542748, SeqNo=20,Updated=TO_TIMESTAMP('2019-09-05 08:00:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560428
;

-- 2019-09-05T08:01:08.712
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542748, SeqNo=30,Updated=TO_TIMESTAMP('2019-09-05 08:01:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560429
;

-- 2019-09-05T08:01:15.901
-- URL zum Konzept
UPDATE AD_UI_Element SET AD_UI_ElementGroup_ID=542748, SeqNo=40,Updated=TO_TIMESTAMP('2019-09-05 08:01:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_UI_Element_ID=560430
;

