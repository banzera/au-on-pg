CREATE OR REPLACE VIEW frm_preorder_subform5 AS

SELECT tblPreOrderItems.*,
       tblSKU.*,
       POOrderTotalPer - POOrderTaxPer AS POPricePer,
       tblPurchaseOrderItems.POOrderQuant,
       tblPurchaseOrderItems.POOrderRcvdQuant
FROM tblPurchaseOrderItems
RIGHT JOIN (
  tblSKU INNER JOIN tblPreOrderItems ON tblSKU.SKUID = tblPreOrderItems.SKUID2)
  ON (tblPurchaseOrderItems.POID = tblPreOrderItems.POID)
AND (tblPurchaseOrderItems.SKUID = tblPreOrderItems.SKUID2)
;

