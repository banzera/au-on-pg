create or replace view qry_order_items_outstanding as

SELECT
       gen_random_uuid() as id,
       tblOrder.OrderID,            tblOrder.OrderDate,
       tblOrder.OrderBatch,         tblOrder.CustID,
       tblOrder.OrderTaxRate,       tblOrder.OrderDeliveredDate,
       tblOrder.OrderDeliverdFrom,  tblOrder.OrderDeliveredTo,
       tblOrder.OrderShipMethod,    tblOrder.OrderReceiptHL,
       tblOrder.OrderDateInvoiced,  tblOrder.OrderDatePaid,
       tblOrder.OrderPaymentMethod, tblOrder.OrderPaymentAmount,
       tblOrder.OrderNotes,

       tblOrderItems.OrderItemsID, tblOrderItems.SKUID,
       tblOrderItems.POID,
       -- tblOrderItems.OrderID,
       tblOrderItems.OrderQuant, tblOrderItems.OrderDeliveredQuant,
       -- [OrderQuant]-[OrderDeliveredQuant] AS OrderQuantDue,
       OrderQuantDue,

       tblOrderItems.OrderPricePer,          tblOrderItems.OrderPriceTotal,
       tblOrderItems.OrderTaxRate as order_item_tax_rate,
       tblOrderItems.OrderTaxTotal,
       tblOrderItems.OrderDeliveryCostTotal, tblOrderItems.OrderFeesTotal,
       tblOrderItems.OrderGrandTotal,        tblOrderItems.OrderItemsDeliveredDate,
       tblOrderItems.OrderRetailTotal,

       -- tblCustomer.CustID,

       tblCustomer.CustName,            tblCustomer.CustBusinessName,
       tblCustomer.CustFIrst,           tblCustomer.CustLast, tblCustomer.CustSal,
       tblCustomer.CustTitle,           tblCustomer.CustAddress, tblCustomer.CustCity,
       tblCustomer.CustSt,              tblCustomer.CustZip, tblCustomer.CustPhone,
       tblCustomer.CustFax,             tblCustomer.CustEmail, tblCustomer.CustPrimaryContact1,
       tblCustomer.CustPhone1,          tblCustomer.CustPhoneType1, tblCustomer.CustEmail1,
       tblCustomer.CustPrimaryContact2, tblCustomer.CustPhone2, tblCustomer.CustPhoneType2,
       tblCustomer.CustEmail2,          tblCustomer.CustTaxRate, tblCustomer.CustNotes,
       tblCustomer.CustDateCreated,     tblCustomer.CustDateModified, tblCustomer.CustBillingBusinessName,
       tblCustomer.CustBillingFirst,    tblCustomer.CustBillingLast, tblCustomer.CustBillingSal,
       tblCustomer.CustBillingTitle,    tblCustomer.CustBillingAddress, tblCustomer.CustBillingCity,
       tblCustomer.CustBillingSt,       tblCustomer.CustBillingZip, tblCustomer.CustBillingPhone,
       tblCustomer.CustBillingFax,      tblCustomer.CustBillingEmail, tblCustomer.CustBillingSame,
       tblCustomer.CustQBO,

       tblSKU.SKU, tblSKU.Manf, tblSKU.ItemNo, tblSKU.SKUDesc, tblSKU.UnitWeight,
       tblSKU.CategoryID, tblSKU.SKUMinUnits, tblSKU.SKUMinUnitsType, tblSKU.DCLoc,
       tblSKU.SKUMinPerCS,

       qryInventoryCounts.Total,
       qryInventoryCounts.TotalRcvd,
       qryInventoryCounts.TotalDue,
       qryInventoryCounts.DCCurQuant
  FROM tblSKU
INNER JOIN tblOrderItems ON tblSKU.SKUID          = tblOrderItems.SKUID
INNER JOIN tblOrder      ON tblOrderItems.OrderID = tblOrder.OrderID
INNER JOIN tblCustomer   ON tblCustomer.CustID    = tblOrder.CustID
 LEFT JOIN qryInventoryCounts ON tblSKU.SKUID = qryInventoryCounts.SKUID,
 LATERAL(
    SELECT
     tblOrderItems.OrderQuant - tblOrderItems.OrderDeliveredQuant
    ) AS s1(OrderQuantDue)
WHERE OrderQuantDue > 0
ORDER BY OrderID;
