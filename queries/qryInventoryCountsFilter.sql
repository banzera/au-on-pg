CREATE OR REPLACE VIEW qryInventoryCountsFilter AS
WITH
qryPOInventoryCountsFilter AS (
   SELECT tblSKU.SKUID,
          tblSKU.SKU,
          tblSKU.Manf,
          tblSKU.ItemNo,
          tblSKU.SKUDesc,
          SUM(COALESCE(tblPurchaseOrderItems.POOrderQuant,0)) AS POTotal,
          SUM(COALESCE(tblPurchaseOrderItems.POOrderRcvdQuant,0)) AS POTotalRcvd
   FROM tblSKU
   LEFT JOIN tblPurchaseOrderItems ON tblSKU.SKUID = tblPurchaseOrderItems.SKUID
   GROUP BY tblSKU.SKUID,
            tblSKU.SKU,
            tblSKU.Manf,
            tblSKU.ItemNo,
            tblSKU.SKUDesc
),
qryOrderInventoryCountsFilter AS (
  SELECT tblSKU.SKUID,
         tblSKU.SKU,
         tblSKU.Manf,
         tblSKU.ItemNo,
         tblSKU.SKUDesc,
         SUM(COALESCE(tblOrderItems.OrderQuant,0)) AS OrdQuant,
         SUM(COALESCE(tblOrderItems.OrderDeliveredQuant,0)) AS OrdDelQuant
  FROM tblSKU
  LEFT JOIN tblOrderItems ON tblSKU.SKUID = tblOrderItems.SKUID
  GROUP BY tblSKU.SKUID,
           tblSKU.SKU,
           tblSKU.Manf,
           tblSKU.ItemNo,
           tblSKU.SKUDesc

 )

 -- Query: qryInventoryCountsFilter

   SELECT qryPOInventoryCountsFilter.SKUID,
          (qryPOInventoryCountsFilter.POTotalRcvd - COALESCE(qryOrderInventoryCountsFilter.OrdDelQuant,0))::int::boolean as InDC
     FROM qryPOInventoryCountsFilter
LEFT JOIN qryOrderInventoryCountsFilter ON qryPOInventoryCountsFilter.SKUID = qryOrderInventoryCountsFilter.SKUID
 GROUP BY qryPOInventoryCountsFilter.SKUID,
          qryPOInventoryCountsFilter.POTotalRcvd - COALESCE(qryOrderInventoryCountsFilter.OrdDelQuant,0)
  -- HAVING

  --     (
  --       qryPOInventoryCountsFilter.POTotalRcvd - COALESCE(qryOrderInventoryCountsFilter.OrdDelQuant,0) > 0
  --     )
                 -- AND (Forms.frmSKU.ckbxInDC)=TRUE)
-- OR (((Forms.frmSKU.ckbxInDC)=FALSE));

