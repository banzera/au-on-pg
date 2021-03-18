CREATE OR REPLACE VIEW frm_preorder_subform2 AS

WITH qryPreOrderSKU2 AS (
SELECT tblSKU.SKUID,
       tblSKU.SKU,
       tblSKU.Manf AS Manf2,
       tblSKU.ItemNo AS ItemNo2,
       tblSKU.SKUDesc AS SKUDesc2,
       tblSKU.UnitWeight,
       tblSKU.CategoryID,
       tblSKU.SKUMinUnits,
       tblSKU.SKUMinUnitsType,
       tblSKU.DCLoc,
       tblSKU.SKUMinPerCS
FROM tblSKU
)
SELECT tblSKU.*,
       tblPreOrderItems.*,
       POOrderTotalPer - POOrderTaxPer AS POPricePer,
       qryPreOrderSKU2.SKUDesc2,
       qryPreOrderSKU2.Manf2,
       qryPreOrderSKU2.ItemNo2
FROM (tblPurchaseOrderItems
      RIGHT JOIN (tblSKU
                  INNER JOIN tblPreOrderItems ON tblSKU.SKUID = tblPreOrderItems.SKUID1) ON (tblPurchaseOrderItems.SKUID = tblPreOrderItems.SKUID2)
      AND (tblPurchaseOrderItems.POID = tblPreOrderItems.POID))
LEFT JOIN qryPreOrderSKU2 ON tblPreOrderItems.SKUID2 = qryPreOrderSKU2.SKUID;

