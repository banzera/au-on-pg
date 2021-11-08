--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tblAnalysis; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblAnalysis (
    AnalysisID integer primary key,
    CustomerID integer,
    AnalysisDate timestamp with time zone,
    StartAnalysisDate timestamp with time zone,
    EndAnalysisDate timestamp with time zone,
    AnalysisSplrID integer
);

--
-- Name: tblAnalysisItems; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblAnalysisItems (
    AnalysisItemsID integer primary key,
    SKUID integer,
    AOrderDate timestamp with time zone,
    AOrderQuant integer,
    AOrderPricePer double precision,
    CustomerID integer,
    SplrID integer,
    VSKU character varying(255),
    SplrID2 integer,
    AnalysisID integer
);

--
-- Name: tblBank; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblBank (
    BankID integer primary key,
    BankName character varying(255),
    BankBusinessName character varying(255),
    BankFIrst character varying(255),
    BankLast character varying(255),
    BankSal character varying(255),
    BankTitle character varying(255),
    BankAddress character varying(255),
    BankCity character varying(255),
    BankSt character varying(255),
    BankZip character varying(255),
    BankPhone character varying(255),
    BankFax character varying(255),
    BankEmail character varying(255),
    BankPrimaryContact1 character varying(255),
    BankPhone1 character varying(255),
    BankPhoneType1 character varying(255),
    BankEmail1 character varying(255),
    BankPrimaryContact2 character varying(255),
    BankPhone2 character varying(255),
    BankPhoneType2 character varying(255),
    BankEmail2 character varying(255),
    BankAcctNo character varying(255),
    BankAcctName character varying(255),
    BankNotes text,
    BankDateModified timestamp with time zone
);

--
-- Name: tblCategory; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblCategory (
    CategoryID integer primary key,
    CategoryDesc character varying(255)
);

--
-- Name: tblCustomer; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblCustomer (
    CustID integer primary key,
    CustName character varying(255),
    CustBusinessName character varying(255),
    CustFIrst character varying(255),
    CustLast character varying(255),
    CustSal character varying(255),
    CustTitle character varying(255),
    CustAddress character varying(255),
    CustCity character varying(255),
    CustSt character varying(255),
    CustZip character varying(255),
    CustPhone character varying(255),
    CustFax character varying(255),
    CustEmail character varying(255),
    CustPrimaryContact1 character varying(255),
    CustPhone1 character varying(255),
    CustPhoneType1 character varying(255),
    CustEmail1 character varying(255),
    CustPrimaryContact2 character varying(255),
    CustPhone2 character varying(255),
    CustPhoneType2 character varying(255),
    CustEmail2 character varying(255),
    CustTaxRate real,
    CustNotes text,
    CustDateCreated timestamp with time zone,
    CustDateModified timestamp with time zone,
    CustBillingBusinessName character varying(255),
    CustBillingFirst character varying(255),
    CustBillingLast character varying(255),
    CustBillingSal character varying(255),
    CustBillingTitle character varying(255),
    CustBillingAddress character varying(255),
    CustBillingCity character varying(255),
    CustBillingSt character varying(255),
    CustBillingZip character varying(255),
    CustBillingPhone character varying(255),
    CustBillingFax character varying(255),
    CustBillingEmail character varying(255),
    CustBillingSame boolean,
    CustQBO boolean,
    CustCCAuth boolean,
    CustCCLast4 character varying(255),
    CustTaxJurisID integer,
    LastRewardDate timestamp with time zone,
    CustHSAcct character varying(255),
    Discontinued boolean,
    CustTYFirstName character varying(255),
    CustTYLastName character varying(255),
    CustTYAddress character varying(255),
    CustTYCity character varying(255),
    CustTYST character varying(255),
    CustTYZip character varying(255),
    CustTYPhone character varying(255),
    CustTYEmail character varying(255)
);

--
-- Name: tblDCLocUpdate; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblDCLocUpdate (
    DCLocUpdateID integer primary key,
    UserName character varying(255),
    SKUID integer,
    TimeStampScanned character varying(255),
    TimeStampRcvd character varying(255),
    DCLoc character varying(255)
);

--
-- Name: tblOrder; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblOrder (
    OrderID integer primary key,
    OrderDate timestamp with time zone,
    OrderBatch character varying(255),
    CustID integer,
    OrderTaxRate real,
    OrderDeliveredDate timestamp with time zone,
    OrderDeliverdFrom character varying(255),
    OrderDeliveredTo character varying(255),
    OrderShipMethod character varying(255),
    OrderReceiptHL character varying(255),
    OrderDateInvoiced timestamp with time zone,
    OrderDatePaid timestamp with time zone,
    OrderPaymentMethod character varying(255),
    OrderPaymentAmount double precision,
    OrderNotes text,
    OrderCCDate timestamp with time zone,
    PreOrderCompleteDate timestamp with time zone,
    OrderConfirmDate timestamp with time zone
);

--
-- Name: tblOrderDeposit; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblOrderDeposit (
    ODepositID integer primary key,
    ODepositDate timestamp with time zone,
    ODepositBatch character varying(255)
);

--
-- Name: tblOrderItems; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblOrderItems (
    OrderItemsID integer primary key,
    SKUID integer,
    POID integer,
    OrderID integer,
    OrderQuant integer,
    OrderPricePer double precision,
    OrderPriceTotal double precision,
    OrderTaxRate real,
    OrderTaxTotal double precision,
    OrderDeliveryCostTotal double precision,
    OrderFeesTotal double precision,
    OrderGrandTotal double precision,
    OrderItemsDeliveredDate timestamp with time zone,
    OrderDeliveredQuant integer,
    OrderRetailTotal double precision
);

--
-- Name: tblOrderPmts; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblOrderPmts (
    OPmtsID integer primary key,
    OPmtsDate timestamp with time zone,
    OPmtsBatch character varying(255)
);

--
-- Name: tblOrderPmtsItems; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblOrderPmtsItems (
    OPmtsItemsID integer primary key,
    OPmtsID integer,
    OrderItemsID integer,
    OPmtsTotal double precision,
    ODepositID integer
);

--
-- Name: tblPercent; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPercent (
    Percent double precision primary key
);

--
-- Name: tblPreOrder; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPreOrder (
    PreOrderID integer primary key,
    PreOrderDate timestamp with time zone,
    PreOrderBatch character varying(255),
    CustID integer,
    PreOrderNotes text,
    PreOrderSH1 double precision,
    PreOrderSH2 double precision,
    PreOrderVendorID integer,
    OrderID integer,
    OrderCreateDate timestamp with time zone,
    PreOrderAnalysisDate timestamp with time zone,
    ConfirmationDate timestamp with time zone,
    PreOrderCheck timestamp with time zone
);

--
-- Name: tblPreOrderCodes; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPreOrderCodes (
    PreOrderCodeID integer primary key,
    PreOrderCode character varying(255),
    PreOrderCodeDesc character varying(255)
);

--
-- Name: tblPreOrderItems; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPreOrderItems (
    PreOrderItemsID integer primary key,
    PreOrderID integer,
    POID integer,
    SKUID1 integer,
    SKUID2 integer,
    OrderQuant1 integer,
    OrderQuant2 integer,
    OrderPricePer1 double precision,
    OrderPricePer2 double precision,
    OrderPriceTotal1 double precision,
    OrderPriceTotal2 double precision,
    OrderAUPricePer double precision,
    PreOrderItemCode integer,
    OrderDate timestamp with time zone,
    PreOrderNotes text
);

--
-- Name: tblPurchaseOrder; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPurchaseOrder (
    POID integer primary key,
    PODate timestamp with time zone,
    POBatch character varying(255),
    SplrID integer,
    SplrID2 integer,
    POShipDate timestamp with time zone,
    POShipType character varying(255),
    POTrackingNo character varying(255),
    PORcvdBy character varying(255),
    PODatePaid timestamp with time zone,
    POMethodPaid character varying(255),
    POPaymentNo character varying(255),
    POAmountPaid double precision,
    PONotes text,
    POSplrOrderNo character varying(255),
    POCheckSentDate timestamp with time zone
);

--
-- Name: tblPurchaseOrderItems; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPurchaseOrderItems (
    POItemsID integer primary key,
    POID integer,
    SKUID integer,
    POOrderQuant integer,
    POOrderPrice double precision,
    POOrderTax double precision,
    POOrderShipping double precision,
    POOrderFees double precision,
    POOrderTotal double precision,
    POOrderPricePer double precision,
    POOrderTaxPer double precision,
    POOrderShippingPer double precision,
    POOrderFeesPer double precision,
    POOrderTotalPer double precision,
    POOrderRcvdDate timestamp with time zone,
    POOrderRcvdQuant integer,
    POOrderExpiration timestamp with time zone,
    POOrderRebateDeadline timestamp with time zone,
    POOrderRebateSubmitted timestamp with time zone,
    POOrderRebate boolean,
    POOrderRebateNotes character varying(255)
);

--
-- Name: tblPurchaseType; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblPurchaseType (
    PurchaseTypeID integer primary key,
    PurchaseType character varying(255)
);

--
-- Name: tblSKU; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblSKU (
    SKUID integer primary key,
    SKU character varying(255),
    Manf character varying(255),
    ItemNo character varying(255),
    SKUDesc character varying(255),
    UnitWeight character varying(255),
    CategoryID integer,
    SKUMinUnits integer,
    SKUMinUnitsType character varying(255),
    DCLoc character varying(255),
    SKUMinPerCS integer,
    VNo01 integer,
    VSKU01 character varying(255),
    VHL01 text,
    VNo02 integer,
    VSKU02 character varying(255),
    VHL02 text,
    VNo03 integer,
    VSKU03 character varying(255),
    VHL03 text,
    VNo04 integer,
    VSKU04 character varying(255),
    VHL04 text,
    VNo05 integer,
    VSKU05 character varying(255),
    VHL05 text,
    VNo06 integer,
    VSKU06 character varying(255),
    VHL06 text,
    VNo07 integer,
    VSKU07 character varying(255),
    VHL07 text,
    VNo08 integer,
    VSKU08 character varying(255),
    VHL08 text,
    VNo09 integer,
    VSKU09 character varying(255),
    VHL09 text,
    VNo10 integer,
    VSKU10 character varying(255),
    VHL10 text,
    SKUHighPrice double precision,
    SKUHighPriceVNo integer,
    SKUHighPriceDate timestamp with time zone,
    SKUClassID integer,
    SKUMaxTemp integer,
    SKUMinTemp integer,
    SKUNotes text
);

--
-- Name: tblSKUClass; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblSKUClass (
    SKUClassID integer primary key,
    SKUClassDesc character varying(255)
);

--
-- Name: tblSKUCustInfo; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblSKUCustInfo (
    SKUCustInfoID integer primary key,
    SKUID integer,
    CustID integer,
    SKUOnly boolean,
    SKUNever boolean,
    SKUOnlyDate timestamp with time zone,
    SKUNeverDate timestamp with time zone,
    SKUCustNotes text
);

--
-- Name: tblShipper; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblShipper (
    ShipID integer primary key,
    ShipName character varying(255),
    ShipFIrst character varying(255),
    ShipLast character varying(255),
    ShipBusinessName character varying(255),
    ShipAddress character varying(255),
    ShipCity character varying(255),
    ShipSt character varying(255),
    ShipZip character varying(255),
    ShipPhone1 character varying(255),
    ShipPhone2 character varying(255),
    ShipFax character varying(255),
    ShipEmail1 character varying(255),
    ShipEmail2 character varying(255),
    ShipPrimaryContact1 character varying(255),
    ShipPrimaryContact2 character varying(255)
);

--
-- Name: tblSupplier; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblSupplier (
    SplrID integer primary key,
    SplrName character varying(255),
    SplrFIrst character varying(255),
    SplrLast character varying(255),
    SplrBusinessName character varying(255),
    SplrAddress character varying(255),
    SplrCity character varying(255),
    SplrSt character varying(255),
    SplrZip character varying(255),
    SplrWebsite character varying(255),
    SplrEmail character varying(255),
    SplrPhone character varying(255),
    SplrFax character varying(255),
    SplrPrimaryContact1 character varying(255),
    SplrPhone1 character varying(255),
    SplrEmail1 character varying(255),
    SplrPrimaryContact2 character varying(255),
    SplrPhone2 character varying(255),
    SplrEmail2 character varying(255),
    SplrTaxID character varying(255),
    SplrQBO boolean,
    SplrNotes text
);

--
-- Name: tblSupplierPmts; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblSupplierPmts (
    SPmtID integer primary key,
    SPmtDate timestamp with time zone,
    SPmtBatch character varying(255)
);

--
-- Name: tblSupplierPmtsItems; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblSupplierPmtsItems (
    SPmtsItemsID integer primary key,
    SPmtsID integer,
    POItemsID integer,
    SPmtsTotal double precision
);

--
-- Name: tblTaxJurisdiction; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblTaxJurisdiction (
    TJID integer primary key,
    JurisdictionCode character varying(255),
    JurisdictionName character varying(255),
    RateEffDate timestamp with time zone,
    TaxRate real
);

--
-- Name: tblUpdateNA; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblUpdateNA (
    SKUID integer primary key
);

--
-- Name: tblVendor; Type: TABLE; Schema: public; Owner: au_audit
--

CREATE TABLE public.tblVendor (
    VendorID integer primary key,
    VendorName character varying(255),
    VendorAbbr character varying(255)
);

--
-- PostgreSQL database dump complete
--

