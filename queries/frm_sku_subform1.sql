CREATE OR REPLACE VIEW frm_sku_subform1 AS

-- WITH
-- qryInventoryCounts as (
-- ),
-- qrySKUCustIDFilter as (
-- ),
-- qryInventoryTransFilter as (
-- ),
-- qryInventoryCountsFilter as (
--   SELECT qryPOInventoryCountsFilter.SKUID
--     FROM qryPOInventoryCountsFilter
-- LEFT JOIN qryOrderInventoryCountsFilter ON qryPOInventoryCountsFilter.SKUID = qryOrderInventoryCountsFilter.SKUID
-- GROUP BY qryPOInventoryCountsFilter.SKUID, [qryPOInventoryCountsFilter]![POTotalRcvd]-Nz([qryOrderInventoryCountsFilter]![OrdDelQuant],0), [Forms]![frmSKU]![ckbxInDC]
-- HAVING ((([qryPOInventoryCountsFilter]![POTotalRcvd]-Nz([qryOrderInventoryCountsFilter]![OrdDelQuant],0))>0) AND (([Forms]![frmSKU]![ckbxInDC])=True)) OR ((([Forms]![frmSKU]![ckbxInDC])=False));

-- )

SELECT tblSKU.*,
       qryInventoryCounts.Total,
       qryInventoryCounts.TotalCases,
       qryInventoryCounts.TotalRcvd,
       qryInventoryCounts.TotalCasesRcvd,
       qryInventoryCounts.TotalDue,
       concat_ws('_',VSKU01,VSKU02,VSKU03,VSKU04,VSKU05,VSKU06,VSKU07,VSKU08,VSKU09,VSKU10) AS VSKUConcat,
       qryInventoryCounts.DCCurQuant,
       qryInventoryCounts.Sold,
       qryInventoryCounts.Bought,
       qryInventoryCountsFilter.indc,
       tblSKUClass.SKUClassDesc
FROM tblSKU
        LEFT JOIN tblSKUClass              ON tblSKU.SKUClassID = tblSKUClass.SKUClassID
        LEFT JOIN qryInventoryCounts       ON tblSKU.SKUID    = qryInventoryCounts.SKUID
       -- INNER JOIN qrySKUCustIDFilter       ON tblSKU.SKUID    = qrySKUCustIDFilter.SKUID
       INNER JOIN qryInventoryCountsFilter ON tblSKU.SKUID    = qryInventoryCountsFilter.SKUID
       -- INNER JOIN qryInventoryTransFilter  ON tblSKU.SKUID    = qryInventoryTransFilter.SKUID
       ;

