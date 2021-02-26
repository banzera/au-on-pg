 -- Query: qryInventoryTransFilter

SELECT qryPOInventoryTransFilter.SKUID
FROM qryPOInventoryTransFilter
GROUP BY qryPOInventoryTransFilter.SKUID,
         Nz([SumOfPOOrderQuant],0)-Nz([SumOfPOOrderRcvdQuant],0), [Forms]![frmSKU]![ckbxInTrans] HAVING (((Nz([SumOfPOOrderQuant],0)-Nz([SumOfPOOrderRcvdQuant],0))>0)
AND ((Forms!frmSKU!ckbxInTrans)=TRUE))
OR (((Forms!frmSKU!ckbxInTrans)=FALSE));
