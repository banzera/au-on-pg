-- Create views

-- for sku form
  \i queries/qryInventoryCounts.sql
  \i queries/qryInventoryCountsFilter.sql

  -- dependency of subform 3
  \i queries/qrySKUOrderHistoryUnion.sql

  \i queries/frm_sku_subform1.sql
  -- subform2 is backed by tblSKU
  \i queries/frm_sku_subform3.sql

   -- used by subform4
  \i queries/qrySKUPOHistAU.sql
  -- used by subform5
  \i queries/qrySKUPOHistAU2.sql

  -- used by frmSKUCustInfoSubform1
  \i queries/frm_SKU_Cust_Info_Subform1.sql

  -- used by frmSKUCustInfoSubform2
  \i queries/frm_SKU_Cust_Info_Subform2.sql

-- for orders outstanding report
  \i queries/qry_order_items_outstanding.sql

-- for preorder form
  -- for subform1
  \i queries/frm_preorder_subform1.sql

  -- for subform2
  \i queries/frm_preorder_subform2.sql

  -- for subform3
  \i queries/frm_preorder_subform3.sql

  -- for subform4
  \i queries/frm_preorder_subform4.sql

  -- for subform4
  \i queries/frm_preorder_subform5.sql

  -- dep of subform 6
  \i queries/qryPreOrderHistoryUnion.sql

  -- for subform6 AND for subform8
  \i queries/frm_preorder_subform6.sql

  -- dependency of qryPreOrderPOHistAU2
  \i queries/qryPreOrderPOHistAU.sql

  -- for subform7
  \i queries/qryPreOrderPOHistAU2.sql

  -- for subform8
  \i queries/qryPreOrderSubList.sql

