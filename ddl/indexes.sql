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
  CREATE  INDEX index_tblPurchaseOrder_on_POAmountPaid ON tblPurchaseOrder (POAmountPaid);
  CREATE UNIQUE INDEX index_tblPurchaseOrder_on_POBatch ON tblPurchaseOrder (POBatch);
  CREATE  INDEX index_tblPurchaseOrder_on_PODatePaid ON tblPurchaseOrder (PODatePaid);
  CREATE  INDEX index_tblPurchaseOrder_on_POMethodPaid ON tblPurchaseOrder (POMethodPaid);
  CREATE  INDEX index_tblPurchaseOrder_on_SplrID ON tblPurchaseOrder (SplrID);
-- Indexes for tblPurchaseOrderItems
-- Indexes for tblPurchaseType
-- Indexes for tblShipper
-- Indexes for tblSKU
  CREATE UNIQUE INDEX index_tblSKU_on_ItemNo ON tblSKU (ItemNo);
  CREATE UNIQUE INDEX index_tblSKU_on_SKU ON tblSKU (SKU);
  CREATE  INDEX index_tblSKU_on_SKUClassID ON tblSKU (SKUClassID);
-- Indexes for tblSKUClass
-- Indexes for tblSKUCustInfo
  CREATE  INDEX index_tblSKUCustInfo_on_CustID ON tblSKUCustInfo (CustID);
  CREATE  INDEX index_tblSKUCustInfo_on_SKUID ON tblSKUCustInfo (SKUID);
-- Indexes for tblSupplier
  CREATE  INDEX index_tblSupplier_on_SplrTaxID ON tblSupplier (SplrTaxID);
-- Indexes for tblSupplierPmts
  CREATE UNIQUE INDEX index_tblSupplierPmts_on_SPmtBatch ON tblSupplierPmts (SPmtBatch);
-- Indexes for tblSupplierPmtsItems
  CREATE  INDEX index_tblSupplierPmtsItems_on_POItemsID ON tblSupplierPmtsItems (POItemsID);
-- Indexes for tblTaxJurisdiction
  CREATE  INDEX index_tblTaxJurisdiction_on_JurisdictionCode ON tblTaxJurisdiction (JurisdictionCode);
-- Indexes for tblUpdateNA
-- Indexes for tblVendor
