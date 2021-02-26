CREATE OR REPLACE VIEW qrySKUOrderHistoryUnion AS

SELECT tblOrder.OrderDate,
       tblOrderItems.SKUID,
       tblPurchaseOrder.SplrID2,
       tblOrderItems.OrderQuant,
       tblOrderItems.OrderPricePer,
       tblOrder.CustID,
       18 AS SplrID,
       tblPurchaseOrder.POID
FROM tblPurchaseOrder
RIGHT JOIN (tblOrder
            RIGHT JOIN tblOrderItems ON tblOrder.OrderID = tblOrderItems.OrderID) ON tblPurchaseOrder.POID = tblOrderItems.POID


UNION
SELECT tblAnalysisItems.AOrderDate AS OrderDate,
       tblAnalysisItems.SKUID,
       tblAnalysisItems.SplrID2,
       tblAnalysisItems.AOrderQuant AS OrderQuant,
       tblAnalysisItems.AOrderPricePer AS OrderPricePer,
       tblAnalysisItems.CustomerID AS CustID,
       tblAnalysisItems.SplrID,
       0 AS POID
FROM tblAnalysisItems


UNION
SELECT tblPreOrder.PreOrderDate AS OrderDate,
       tblPreOrderItems.SKUID1 AS SKUID,
       tblPreOrder.PreOrderVendorID AS SplrID2,
       tblPreOrderItems.OrderQuant1 AS OrderQuant,
       tblPreOrderItems.OrderPricePer1 AS OrderPricePer,
       tblPreOrder.CustID,
       tblPreOrder.PreOrderVendorID AS SplrID,
       4444 AS POID
FROM tblPreOrderItems
INNER JOIN tblPreOrder ON tblPreOrderItems.PreOrderID = tblPreOrder.PreOrderID
WHERE (((tblPreOrderItems.PreOrderItemCode)=4))


UNION
SELECT tblPreOrder.PreOrderDate AS OrderDate,
       tblPreOrderItems.SKUID2 AS SKUID,
       2 AS SplrID2,
       tblPreOrderItems.OrderQuant2 AS OrderQuant,
       tblPreOrderItems.OrderPricePer2 AS OrderPricePer,
       tblPreOrder.CustID,
       2 AS SplrID,
       5555 AS POID
FROM tblPreOrderItems
INNER JOIN tblPreOrder ON tblPreOrderItems.PreOrderID = tblPreOrder.PreOrderID
WHERE (((tblPreOrderItems.PreOrderItemCode)=5))

