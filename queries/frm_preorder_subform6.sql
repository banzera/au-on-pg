CREATE OR REPLACE VIEW frm_preorder_subform6 AS

SELECT qryPreOrderHistoryUnion.SKUID,
       qryPreOrderHistoryUnion.OrderDate,
       qryPreOrderHistoryUnion.OrderQuant,
       qryPreOrderHistoryUnion.OrderPricePer,
       qryPreOrderHistoryUnion.SplrID2,
       qryPreOrderHistoryUnion.SplrID,
       tblCustomer.CustBusinessName,
       qryPreOrderHistoryUnion.CustID
FROM tblCustomer
INNER JOIN qryPreOrderHistoryUnion ON tblCustomer.CustID = qryPreOrderHistoryUnion.CustID
ORDER BY qryPreOrderHistoryUnion.OrderDate DESC;

