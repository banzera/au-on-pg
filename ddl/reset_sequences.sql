SELECT setval('tblAnalysis_id_seq',           COALESCE((SELECT MAX(AnalysisID) FROM tblAnalysis), 1));
SELECT setval('tblAnalysisItems_id_seq',      COALESCE((SELECT MAX(AnalysisItemsID) FROM tblAnalysisItems), 1));
SELECT setval('tblBank_id_seq',               COALESCE((SELECT MAX(BankID) FROM tblBank), 1));
SELECT setval('tblCategory_id_seq',           COALESCE((SELECT MAX(CategoryID) FROM tblCategory), 1));
SELECT setval('tblCustomer_id_seq',           COALESCE((SELECT MAX(CustID) FROM tblCustomer), 1));
SELECT setval('tblDCLocUpdate_id_seq',        COALESCE((SELECT MAX(DCLocUpdateID) FROM tblDCLocUpdate), 1));
SELECT setval('tblOrder_id_seq',              COALESCE((SELECT MAX(OrderID) FROM tblOrder), 1));
SELECT setval('tblOrderDeposit_id_seq',       COALESCE((SELECT MAX(ODepositID) FROM tblOrderDeposit), 1));
SELECT setval('tblOrderItems_id_seq',         COALESCE((SELECT MAX(OrderItemsID) FROM tblOrderItems), 1));
SELECT setval('tblOrderPmts_id_seq',          COALESCE((SELECT MAX(OPmtsID) FROM tblOrderPmts), 1));
SELECT setval('tblOrderPmtsItems_id_seq',     COALESCE((SELECT MAX(OPmtsItemsID) FROM tblOrderPmtsItems), 1));
SELECT setval('tblPreOrder_id_seq',           COALESCE((SELECT MAX(PreOrderID) FROM tblPreOrder), 1));
SELECT setval('tblPreOrderCodes_id_seq',      COALESCE((SELECT MAX(PreOrderCodeID) FROM tblPreOrderCodes), 1));
SELECT setval('tblPreOrderItems_id_seq',      COALESCE((SELECT MAX(PreOrderItemsID) FROM tblPreOrderItems), 1));
SELECT setval('tblPurchaseOrder_id_seq',      COALESCE((SELECT MAX(POID) FROM tblPurchaseOrder), 1));
SELECT setval('tblPurchaseOrderItems_id_seq', COALESCE((SELECT MAX(POItemsID) FROM tblPurchaseOrderItems), 1));
SELECT setval('tblPurchaseType_id_seq',       COALESCE((SELECT MAX(PurchaseTypeID) FROM tblPurchaseType), 1));
SELECT setval('tblSKU_id_seq',                COALESCE((SELECT MAX(SKUID) FROM tblSKU), 1));
SELECT setval('tblSKUClass_id_seq',           COALESCE((SELECT MAX(SKUClassID) FROM tblSKUClass), 1));
SELECT setval('tblSKUCustInfo_id_seq',        COALESCE((SELECT MAX(SKUCustInfoID) FROM tblSKUCustInfo), 1));
SELECT setval('tblShipper_id_seq',            COALESCE((SELECT MAX(ShipID) FROM tblShipper), 1));
SELECT setval('tblSupplier_id_seq',           COALESCE((SELECT MAX(SplrID) FROM tblSupplier), 1));
SELECT setval('tblSupplierPmts_id_seq',       COALESCE((SELECT MAX(SPmtID) FROM tblSupplierPmts), 1));
SELECT setval('tblSupplierPmtsItems_id_seq',  COALESCE((SELECT MAX(SPmtsItemsID) FROM tblSupplierPmtsItems), 1));
SELECT setval('tblTaxJurisdiction_id_seq',    COALESCE((SELECT MAX(TJID) FROM tblTaxJurisdiction), 1));
SELECT setval('tblUpdateNA_id_seq',           COALESCE((SELECT MAX(SKUID) FROM tblUpdateNA), 1));
SELECT setval('tblVendor_id_seq',             COALESCE((SELECT MAX(VendorID) FROM tblVendor), 1));
