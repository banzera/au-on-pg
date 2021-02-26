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
         tblSKU.SKUDesc;

