create view qryInventoryCounts as

WITH
qryPOInventoryCounts AS (
-- Query: qryPOInventoryCounts
SELECT tblSKU.SKUID,
       tblSKU.SKU,
       tblSKU.Manf,
       tblSKU.ItemNo,
       tblSKU.SKUDesc,
       SUM(COALESCE(tblPurchaseOrderItems.POOrderQuant,0)) AS POTotal,
       SUM(COALESCE(tblPurchaseOrderItems.POOrderRcvdQuant,0)) AS POTotalRcvd
FROM tblSKU
INNER JOIN tblPurchaseOrderItems ON tblSKU.SKUID = tblPurchaseOrderItems.SKUID
GROUP BY tblSKU.SKUID,
         tblSKU.SKU,
         tblSKU.Manf,
         tblSKU.ItemNo,
         tblSKU.SKUDesc
),
qryOrderInventoryCounts AS (
-- Query: qryOrderInventoryCounts
SELECT tblSKU.SKUID,
       tblSKU.SKU,
       tblSKU.Manf,
       tblSKU.ItemNo,
       tblSKU.SKUDesc,
       SUM(COALESCE(tblOrderItems.OrderQuant,0)) AS OrdQuant,
       SUM(COALESCE(tblOrderItems.OrderDeliveredQuant,0)) AS OrdDelQuant
FROM tblSKU
INNER JOIN tblOrderItems ON tblSKU.SKUID = tblOrderItems.SKUID
GROUP BY tblSKU.SKUID,
         tblSKU.SKU,
         tblSKU.Manf,
         tblSKU.ItemNo,
         tblSKU.SKUDesc
)
-- Query: qryInventoryCounts
SELECT qryPOInventoryCounts.SKUID,
       qryPOInventoryCounts.SKU,
       qryPOInventoryCounts.Manf,
       qryPOInventoryCounts.ItemNo,
       qryPOInventoryCounts.SKUDesc,
       -- qryPOInventoryCounts.POTotal - COALESCE(qryOrderInventoryCounts.OrdQuant,0) AS Total,
       Total,
       (Total * tblSKU.SKUMinUnits) AS TotalUnits,
       tblSKU.SKUMinPerCS,
       (Total / tblSKU.SKUMinPerCS) AS TotalCases,
       tblSKU.DCLoc,
       tblSKU.CategoryID,
       -- qryPOInventoryCounts.POTotalRcvd -  COALESCE(qryOrderInventoryCounts.OrdQuant,0) AS TotalRcvd,
       TotalRcvd,
       TotalRcvd * tblSKU.SKUMinUnits AS TotalUnitsRcvd,
       TotalRcvd / tblSKU.SKUMinPerCS AS TotalCasesRcvd,
       Total - TotalRcvd AS TotalDue,
       qryPOInventoryCounts.POTotalRcvd - COALESCE(qryOrderInventoryCounts.OrdDelQuant,0) AS DCCurQuant,
       COALESCE(qryOrderInventoryCounts.OrdQuant,0) AS Sold,
       COALESCE(qryPOInventoryCounts.POTotal,0) AS Bought
 FROM tblSKU
 JOIN qryOrderInventoryCounts ON tblSKU.SKUID = qryOrderInventoryCounts.SKUID
 JOIN qryPOInventoryCounts    ON tblSKU.SKUID = qryPOInventoryCounts.SKUID,
  LATERAL(
    SELECT
      qryPOInventoryCounts.POTotal     - COALESCE(qryOrderInventoryCounts.OrdQuant,0),
      qryPOInventoryCounts.POTotalRcvd - COALESCE(qryOrderInventoryCounts.OrdQuant,0)
    ) AS s1(total, TotalRcvd)
;
