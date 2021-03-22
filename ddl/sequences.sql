CREATE SEQUENCE public.tblAnalysis_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblAnalysis_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblAnalysis_id_seq OWNED BY public.tblAnalysis.AnalysisID;
ALTER TABLE ONLY public.tblAnalysis ALTER COLUMN AnalysisID SET DEFAULT nextval('tblAnalysis_id_seq'::regclass);


CREATE SEQUENCE public.tblAnalysisItems_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblAnalysisItems_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblAnalysisItems_id_seq OWNED BY public.tblAnalysisItems.AnalysisItemsID;
ALTER TABLE ONLY public.tblAnalysisItems ALTER COLUMN AnalysisItemsID SET DEFAULT nextval('tblAnalysisItems_id_seq'::regclass);

CREATE SEQUENCE public.tblBank_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblBank_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblBank_id_seq OWNED BY public.tblBank.BankID;
ALTER TABLE ONLY public.tblBank ALTER COLUMN BankID SET DEFAULT nextval('tblBank_id_seq'::regclass);

CREATE SEQUENCE public.tblCategory_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblCategory_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblCategory_id_seq OWNED BY public.tblCategory.CategoryID;
ALTER TABLE ONLY public.tblCategory ALTER COLUMN CategoryID SET DEFAULT nextval('tblCategory_id_seq'::regclass);

CREATE SEQUENCE public.tblCustomer_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblCustomer_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblCustomer_id_seq OWNED BY public.tblCustomer.CustID;
ALTER TABLE ONLY public.tblCustomer ALTER COLUMN CustID SET DEFAULT nextval('tblCustomer_id_seq'::regclass);

CREATE SEQUENCE public.tblDCLocUpdate_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblDCLocUpdate_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblDCLocUpdate_id_seq OWNED BY public.tblDCLocUpdate.DCLocUpdateID;
ALTER TABLE ONLY public.tblDCLocUpdate ALTER COLUMN DCLocUpdateID SET DEFAULT nextval('tblDCLocUpdate_id_seq'::regclass);

CREATE SEQUENCE public.tblOrder_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblOrder_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblOrder_id_seq OWNED BY public.tblOrder.OrderID;
ALTER TABLE ONLY public.tblOrder ALTER COLUMN OrderID SET DEFAULT nextval('tblOrder_id_seq'::regclass);

CREATE SEQUENCE public.tblOrderDeposit_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblOrderDeposit_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblOrderDeposit_id_seq OWNED BY public.tblOrderDeposit.ODepositID;
ALTER TABLE ONLY public.tblOrderDeposit ALTER COLUMN ODepositID SET DEFAULT nextval('tblOrderDeposit_id_seq'::regclass);

CREATE SEQUENCE public.tblOrderItems_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblOrderItems_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblOrderItems_id_seq OWNED BY public.tblOrderItems.OrderItemsID;
ALTER TABLE ONLY public.tblOrderItems ALTER COLUMN OrderItemsID SET DEFAULT nextval('tblOrderItems_id_seq'::regclass);

CREATE SEQUENCE public.tblOrderPmts_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblOrderPmts_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblOrderPmts_id_seq OWNED BY public.tblOrderPmts.OPmtsID;
ALTER TABLE ONLY public.tblOrderPmts ALTER COLUMN OPmtsID SET DEFAULT nextval('tblOrderPmts_id_seq'::regclass);

CREATE SEQUENCE public.tblOrderPmtsItems_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblOrderPmtsItems_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblOrderPmtsItems_id_seq OWNED BY public.tblOrderPmtsItems.OPmtsItemsID;
ALTER TABLE ONLY public.tblOrderPmtsItems ALTER COLUMN OPmtsItemsID SET DEFAULT nextval('tblOrderPmtsItems_id_seq'::regclass);

CREATE SEQUENCE public.tblPreOrder_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblPreOrder_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblPreOrder_id_seq OWNED BY public.tblPreOrder.PreOrderID;
ALTER TABLE ONLY public.tblPreOrder ALTER COLUMN PreOrderID SET DEFAULT nextval('tblPreOrder_id_seq'::regclass);

CREATE SEQUENCE public.tblPreOrderCodes_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblPreOrderCodes_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblPreOrderCodes_id_seq OWNED BY public.tblPreOrderCodes.PreOrderCodeID;
ALTER TABLE ONLY public.tblPreOrderCodes ALTER COLUMN PreOrderCodeID SET DEFAULT nextval('tblPreOrderCodes_id_seq'::regclass);

CREATE SEQUENCE public.tblPreOrderItems_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblPreOrderItems_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblPreOrderItems_id_seq OWNED BY public.tblPreOrderItems.PreOrderItemsID;
ALTER TABLE ONLY public.tblPreOrderItems ALTER COLUMN PreOrderItemsID SET DEFAULT nextval('tblPreOrderItems_id_seq'::regclass);

CREATE SEQUENCE public.tblPurchaseOrder_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblPurchaseOrder_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblPurchaseOrder_id_seq OWNED BY public.tblPurchaseOrder.POID;
ALTER TABLE ONLY public.tblPurchaseOrder ALTER COLUMN POID SET DEFAULT nextval('tblPurchaseOrder_id_seq'::regclass);

CREATE SEQUENCE public.tblPurchaseOrderItems_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblPurchaseOrderItems_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblPurchaseOrderItems_id_seq OWNED BY public.tblPurchaseOrderItems.POItemsID;
ALTER TABLE ONLY public.tblPurchaseOrderItems ALTER COLUMN POItemsID SET DEFAULT nextval('tblPurchaseOrderItems_id_seq'::regclass);

CREATE SEQUENCE public.tblPurchaseType_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblPurchaseType_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblPurchaseType_id_seq OWNED BY public.tblPurchaseType.PurchaseTypeID;
ALTER TABLE ONLY public.tblPurchaseType ALTER COLUMN PurchaseTypeID SET DEFAULT nextval('tblPurchaseType_id_seq'::regclass);

CREATE SEQUENCE public.tblSKU_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblSKU_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblSKU_id_seq OWNED BY public.tblSKU.SKUID;
ALTER TABLE ONLY public.tblSKU ALTER COLUMN SKUID SET DEFAULT nextval('tblSKU_id_seq'::regclass);

CREATE SEQUENCE public.tblSKUClass_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblSKUClass_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblSKUClass_id_seq OWNED BY public.tblSKUClass.SKUClassID;
ALTER TABLE ONLY public.tblSKUClass ALTER COLUMN SKUClassID SET DEFAULT nextval('tblSKUClass_id_seq'::regclass);

CREATE SEQUENCE public.tblSKUCustInfo_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblSKUCustInfo_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblSKUCustInfo_id_seq OWNED BY public.tblSKUCustInfo.SKUCustInfoID;
ALTER TABLE ONLY public.tblSKUCustInfo ALTER COLUMN SKUCustInfoID SET DEFAULT nextval('tblSKUCustInfo_id_seq'::regclass);

CREATE SEQUENCE public.tblShipper_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblShipper_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblShipper_id_seq OWNED BY public.tblShipper.ShipID;
ALTER TABLE ONLY public.tblShipper ALTER COLUMN ShipID SET DEFAULT nextval('tblShipper_id_seq'::regclass);

CREATE SEQUENCE public.tblSupplier_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblSupplier_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblSupplier_id_seq OWNED BY public.tblSupplier.SplrID;
ALTER TABLE ONLY public.tblSupplier ALTER COLUMN SplrID SET DEFAULT nextval('tblSupplier_id_seq'::regclass);

CREATE SEQUENCE public.tblSupplierPmts_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblSupplierPmts_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblSupplierPmts_id_seq OWNED BY public.tblSupplierPmts.SPmtID;
ALTER TABLE ONLY public.tblSupplierPmts ALTER COLUMN SPmtID SET DEFAULT nextval('tblSupplierPmts_id_seq'::regclass);

CREATE SEQUENCE public.tblSupplierPmtsItems_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblSupplierPmtsItems_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblSupplierPmtsItems_id_seq OWNED BY public.tblSupplierPmtsItems.SPmtsItemsID;
ALTER TABLE ONLY public.tblSupplierPmtsItems ALTER COLUMN SPmtsItemsID SET DEFAULT nextval('tblSupplierPmtsItems_id_seq'::regclass);

CREATE SEQUENCE public.tblTaxJurisdiction_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblTaxJurisdiction_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblTaxJurisdiction_id_seq OWNED BY public.tblTaxJurisdiction.TJID;
ALTER TABLE ONLY public.tblTaxJurisdiction ALTER COLUMN TJID SET DEFAULT nextval('tblTaxJurisdiction_id_seq'::regclass);

CREATE SEQUENCE public.tblUpdateNA_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblUpdateNA_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblUpdateNA_id_seq OWNED BY public.tblUpdateNA.SKUID;
ALTER TABLE ONLY public.tblUpdateNA ALTER COLUMN SKUID SET DEFAULT nextval('tblUpdateNA_id_seq'::regclass);

CREATE SEQUENCE public.tblVendor_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
-- ALTER  SEQUENCE public.tblVendor_id_seq OWNER TO au_audit;
ALTER  SEQUENCE public.tblVendor_id_seq OWNED BY public.tblVendor.VendorID;
ALTER TABLE ONLY public.tblVendor ALTER COLUMN VendorID SET DEFAULT nextval('tblVendor_id_seq'::regclass);


