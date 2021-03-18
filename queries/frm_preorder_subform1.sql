CREATE OR REPLACE VIEW frm_preorder_subform1 AS

    SELECT
           -- tblPreOrder.*,
           tblPreOrder.preorderid,
           tblPreOrder.preorderdate::date,
           tblPreOrder.preorderbatch,
           -- tblPreOrder.custid,
           tblPreOrder.preordernotes,
           tblPreOrder.preordersh1,
           tblPreOrder.preordersh2,
           tblPreOrder.preordervendorid,
           tblPreOrder.orderid,
           tblPreOrder.ordercreatedate::date,
           tblPreOrder.preorderanalysisdate::date,
           tblPreOrder.confirmationdate::date,
           tblPreOrder.preordercheck::date,
           tblCustomer.*,
           tblSupplier.SplrBusinessName
      FROM tblPreOrder
INNER JOIN tblSupplier            ON tblPreOrder.PreOrderVendorID = tblSupplier.SplrID
INNER JOIN tblCustomer            ON tblPreOrder.CustID           = tblCustomer.CustID
-- INNER JOIN qryPreOrderSKUIDFilter ON tblPreOrder.PreOrderID       = qryPreOrderSKUIDFilter.PreOrderID
;
