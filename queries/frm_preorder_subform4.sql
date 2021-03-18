CREATE OR REPLACE VIEW frm_preorder_subform4 AS

SELECT tblPreOrder.PreOrderID,
       tblPreOrder.PreOrderDate,
       tblPreOrder.PreOrderBatch,
       tblPreOrder.CustID,
       tblPreOrder.PreOrderNotes,
       tblPreOrder.PreOrderSH1,
       tblPreOrder.PreOrderSH2,
       tblPreOrder.PreOrderVendorID,
       tblPreOrder.OrderID,
       tblPreOrder.OrderCreateDate,
       tblCustomer.CustEmail1,
       tblPreOrder.PreOrderAnalysisDate,
       tblPreOrder.ConfirmationDate,
       tblCustomer.LastRewardDate,
       tblCustomer.CustPrimaryContact1,
       tblCustomer.CustPrimaryContact2,
       tblCustomer.CustEmail2,
       tblPreOrder.PreOrderCheck
FROM tblPreOrder
LEFT JOIN tblCustomer ON tblPreOrder.CustID = tblCustomer.CustID
;
