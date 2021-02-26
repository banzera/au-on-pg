 -- Query: qrySKUCustIDFilter

SELECT tblSKU.SKUID
FROM qryPurchHistUnion
RIGHT JOIN tblSKU ON qryPurchHistUnion.SKUID = tblSKU.SKUID
WHERE (((Forms!frmSKU!txtSKUCustID) IS NULL))
  OR (((Forms!frmSKU!txtSKUCustID) IS NOT NULL)
      AND ((qryPurchHistUnion.CustID)=Forms!frmSKU!txtSKUCustID))
GROUP BY tblSKU.SKUID;

