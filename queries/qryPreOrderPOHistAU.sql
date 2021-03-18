CREATE OR REPLACE VIEW qryPreOrderPOHistAU AS

SELECT tblPurchaseOrder.PODate,
       tblPurchaseOrderItems.SKUID,
       tblPurchaseOrder.SplrID2,
       tblSupplier.SplrName,
       tblPurchaseOrderItems.POOrderQuant,
       tblPurchaseOrderItems.POOrderPricePer,
       PriceEachLessTax,
       tblPurchaseOrder.POID, tblPurchaseOrderItems.POOrderRcvdQuant,
       PODiff,
       tblPurchaseOrderItems.POOrderExpiration
  FROM tblSupplier
INNER JOIN tblPurchaseOrder      ON tblSupplier.SplrID = tblPurchaseOrder.SplrID2
INNER JOIN tblPurchaseOrderItems ON tblPurchaseOrder.POID = tblPurchaseOrderItems.POID,
 LATERAL(
    SELECT
      tblPurchaseOrderItems.POOrderTotalPer - tblPurchaseOrderItems.POOrderTaxPer,
      tblPurchaseOrderItems.POOrderQuant - tblPurchaseOrderItems.POOrderRcvdQuant
    ) AS s1(PriceEachLessTax, PODiff)
;
