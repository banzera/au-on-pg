CREATE OR REPLACE VIEW frm_sku_subform3 AS

SELECT qrySKUOrderHistoryUnion.SKUID,
       qrySKUOrderHistoryUnion.OrderDate,
       qrySKUOrderHistoryUnion.OrderQuant,
       qrySKUOrderHistoryUnion.OrderPricePer,
       qrySKUOrderHistoryUnion.SplrID2,
       qrySKUOrderHistoryUnion.SplrID,
       tblCustomer.CustBusinessName,
       qrySKUOrderHistoryUnion.CustID,
       qrySKUOrderHistoryUnion.POID
FROM qrySKUOrderHistoryUnion
INNER JOIN tblCustomer ON qrySKUOrderHistoryUnion.CustID = tblCustomer.CustID
ORDER BY qrySKUOrderHistoryUnion.OrderDate DESC;
