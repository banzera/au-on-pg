CREATE OR REPLACE VIEW qryskupohistau AS
 -- Query: qrySKUPOhistAU
SELECT tblPurchaseOrder.PODate,
       tblPurchaseOrderItems.SKUID,
       tblPurchaseOrder.SplrID2,
       tblSupplier.SplrName,
       tblPurchaseOrderItems.POOrderQuant,
       tblPurchaseOrderItems.POOrderPricePer,
       tblPurchaseOrderItems.POOrderTotalPer - tblPurchaseOrderItems.POOrderTaxPer AS PriceEachLessTax,
       tblPurchaseOrder.POID,
       tblPurchaseOrderItems.POOrderRcvdQuant,
       POOrderQuant - POOrderRcvdQuant AS PODiff,
       tblPurchaseOrderItems.POOrderExpiration
FROM tblSupplier
INNER JOIN tblPurchaseOrder ON tblSupplier.SplrID = tblPurchaseOrder.SplrID2
INNER JOIN tblPurchaseOrderItems ON tblPurchaseOrder.POID = tblPurchaseOrderItems.POID;

