\timing off
create index index_tblanalysis_on_analysissplrid on tblAnalysis (AnalysisSplrID);
create index index_tblanalysis_on_customerid     on tblAnalysis (CustomerID);

create index index_tblanalysisitems_on_customerid on tblAnalysisItems (CustomerID);
create index index_tblanalysisitems_on_skuid      on tblAnalysisItems (SKUID);
create index index_tblanalysisitems_on_splrid     on tblAnalysisItems (SplrID);

create index index_tblbank_on_bankname on tblBank (BankName);

create index index_tblcustomer_on_custname       on tblCustomer (CustName);
create index index_tblcustomer_on_custtaxjurisid on tblCustomer (CustTaxJurisID);

create index index_tbldclocupdate_on_skuid on tblDCLocUpdate (SKUID);

create index index_tblorder_on_custid            on tblOrder (CustID);
create index index_tblorder_on_orderbatch        on tblOrder (OrderBatch);
create index index_tblorder_on_orderdatepaid     on tblOrder (OrderDatePaid);
create index index_tblorder_on_orderdateinvoiced on tblOrder (OrderDateInvoiced);

create index index_tblorderdeposit_on_odepositbatch on tblOrderDeposit (ODepositBatch);

create index index_tblorderitems_on_poid    on tblOrderItems (POID);
create index index_tblorderitems_on_orderid on tblOrderItems (OrderID);
create index index_tblorderitems_on_skuid   on tblOrderItems (SKUID);

create index index_tblorderpmts_on_pobatch on tblOrderPmts (OPmtsBatch);

create index index_tblorderpmtsitems_on_orderitemsid on tblOrderPmtsItems (OrderItemsID);
create index index_tblorderpmtsitems_on_opmtsid      on tblOrderPmtsItems (OPmtsID);

create index index_tblpreorder_on_custid           on tblPreOrder (CustID);
create index index_tblpreorder_on_preorderbatch    on tblPreOrder (PreOrderBatch);
create index index_tblpreorder_on_preordervendorid on tblPreOrder (PreOrderVendorID);

create index index_tblpreordercodes_on_preordercode on tblPreOrderCodes (PreOrderCode);

create index index_tblpreorderitems_on_preorderitemcode on tblPreOrderItems (PreOrderItemCode);

-- Indexes for tblPurchaseOrder
  create index index_tblPurchaseOrder_on_POAmountPaid on tblPurchaseOrder (POAmountPaid);
  create index index_tblPurchaseOrder_on_POBatch on tblPurchaseOrder (POBatch);
  create index index_tblPurchaseOrder_on_PODatePaid on tblPurchaseOrder (PODatePaid);
  create index index_tblPurchaseOrder_on_POMethodPaid on tblPurchaseOrder (POMethodPaid);
  -- skipping Primary Key index
  create index index_tblPurchaseOrder_on_SplrID on tblPurchaseOrder (SplrID);
  create index index_tblPurchaseOrder_on_SplrID on tblPurchaseOrder (SplrID);
-- Indexes for tblPurchaseOrderItems
  -- skipping Primary Key index
  create index index_tblPurchaseOrderItems_on_POID on tblPurchaseOrderItems (POID);
  create index index_tblPurchaseOrderItems_on_SKUID on tblPurchaseOrderItems (SKUID);
-- Indexes for tblPurchaseType
  -- skipping Primary Key index
-- Indexes for tblShipper
  -- skipping Primary Key index
-- Indexes for tblSKU
  create index index_tblSKU_on_ItemNo on tblSKU (ItemNo);
  -- skipping Primary Key index
  create index index_tblSKU_on_SKU on tblSKU (SKU);
  create index index_tblSKU_on_SKUClassID on tblSKU (SKUClassID);
-- Indexes for tblSKUClass
  -- skipping Primary Key index
-- Indexes for tblSKUCustInfo
  create index index_tblSKUCustInfo_on_CustID on tblSKUCustInfo (CustID);
  -- skipping Primary Key index
  create index index_tblSKUCustInfo_on_SKUID on tblSKUCustInfo (SKUID);
-- Indexes for tblSupplier
  -- skipping Primary Key index
  create index index_tblSupplier_on_SplrTaxID on tblSupplier (SplrTaxID);
-- Indexes for tblSupplierPmts
  create index index_tblSupplierPmts_on_SPmtBatch on tblSupplierPmts (SPmtBatch);
  -- skipping Primary Key index
-- Indexes for tblSupplierPmtsItems
  create index index_tblSupplierPmtsItems_on_POItemsID on tblSupplierPmtsItems (POItemsID);
  -- skipping Primary Key index
  create index index_tblSupplierPmtsItems_on_POItemsID on tblSupplierPmtsItems (POItemsID);
  create index index_tblSupplierPmtsItems_on_SPmtsID on tblSupplierPmtsItems (SPmtsID);
-- Indexes for tblTaxJurisdiction
  create index index_tblTaxJurisdiction_on_JurisdictionCode on tblTaxJurisdiction (JurisdictionCode);
  -- skipping Primary Key index
-- Indexes for tblUpdateNA
-- Indexes for tblVendor
  -- skipping Primary Key index
