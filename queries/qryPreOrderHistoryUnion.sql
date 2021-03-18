CREATE OR REPLACE VIEW qryPreOrderHistoryUnion AS

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
       tblAnalysisItems.AnalysisItemsID AS POID
FROM tblAnalysisItems;

