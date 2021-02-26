\timing off
--- indexes

--CREATE UNIQUE INDEX name ON table (column [, ...]);

ALTER TABLE public.tblOrderPmtsItems ADD FOREIGN KEY (OPmtsID)      REFERENCES tblOrderPmts;
ALTER TABLE public.tblOrderPmtsItems ADD FOREIGN KEY (OrderItemsID) REFERENCES tblOrderItems;

ALTER TABLE public.tblOrder ADD FOREIGN KEY (CustID)  REFERENCES tblCustomer;

ALTER TABLE public.tblOrderItems ADD FOREIGN KEY (OrderID) REFERENCES tblOrder;
ALTER TABLE public.tblOrderItems ADD FOREIGN KEY (SKUID)   REFERENCES tblSKU;
ALTER TABLE public.tblOrderItems ADD FOREIGN KEY (POID)    REFERENCES tblPurchaseOrder;

ALTER TABLE public.tblPurchaseOrder ADD FOREIGN KEY (SplrID) REFERENCES tblSupplier;

ALTER TABLE public.tblPurchaseOrderItems ADD FOREIGN KEY (SKUID) REFERENCES tblSKU;
ALTER TABLE public.tblPurchaseOrderItems ADD FOREIGN KEY (POID)  REFERENCES tblPurchaseOrder;

ALTER TABLE public.tblSupplierPmtsItems ADD FOREIGN KEY (SPmtsID)   REFERENCES tblSupplierPmts;
ALTER TABLE public.tblSupplierPmtsItems ADD FOREIGN KEY (POItemsID) REFERENCES tblPurchaseOrderItems;
