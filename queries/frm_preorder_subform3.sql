CREATE OR REPLACE VIEW frm_preorder_subform3 AS
SELECT tblPreOrderItems.*,
       tblSKU.*
FROM tblSKU
INNER JOIN tblPreOrderItems ON tblSKU.SKUID = tblPreOrderItems.SKUID1;

