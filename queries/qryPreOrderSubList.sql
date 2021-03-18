CREATE OR REPLACE VIEW qryPreOrderSubList AS

    SELECT tblPreOrderItems.SKUID1,
           tblPreOrderItems.SKUID2,
           tblCustomer.CustName
      FROM tblPreOrderItems
INNER JOIN tblPreOrder ON tblPreOrderItems.PreOrderID = tblPreOrder.PreOrderID
INNER JOIN tblCustomer ON tblPreOrder.CustID = tblCustomer.CustID
GROUP BY tblPreOrderItems.SKUID1,
         tblPreOrderItems.SKUID2,
         tblCustomer.CustName,
         tblPreOrder.CustID
HAVING
    -- (((tblPreOrderItems.SKUID1)=[Forms]![frmPreOrder]![txtPreOrderSKU1])
    --AND
     tblPreOrderItems.SKUID2 != 0
;
