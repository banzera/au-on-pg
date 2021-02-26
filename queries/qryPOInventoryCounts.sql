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
         tblSKU.SKUDesc;
