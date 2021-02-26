CREATE OR REPLACE VIEW frm_sku_cust_info_subform1 AS
SELECT tblSKUCustInfo.SKUID,
       tblSKUCustInfo.CustID,
       tblSKUCustInfo.SKUNever,
       tblSKUCustInfo.SKUNeverDate,
       tblCustomer.CustName,
       tblCustomer.CustBusinessName,
       tblCustomer.CustLast
FROM tblSKUCustInfo
INNER JOIN tblCustomer ON tblSKUCustInfo.CustID = tblCustomer.CustID
WHERE (((tblSKUCustInfo.SKUNever)='Yes'));

