create view vw_inventory_null_check as

WITH qryInventoryNegativeCheck1 AS
  (SELECT "tblPurchaseOrderItems"."POID",
          "tblPurchaseOrderItems"."SKUID",
          "tblPurchaseOrderItems"."POOrderRcvdQuant"
   FROM "tblPurchaseOrderItems"),
     qryInventoryNegativeCheck2 AS
  (SELECT "tblOrderItems"."SKUID",
          "tblOrderItems"."POID",
          Sum("tblOrderItems"."OrderDeliveredQuant") AS "SumOfOrderDeliveredQuant"
   FROM "tblOrderItems"
   GROUP BY "tblOrderItems"."SKUID",
            "tblOrderItems"."POID"
   ORDER BY "tblOrderItems"."SKUID")
SELECT qryInventoryNegativeCheck2."SKUID",
       qryInventoryNegativeCheck2."POID",
       "POOrderRcvdQuant" - "SumOfOrderDeliveredQuant" AS "Quant",
       "tblSKU"."Manf",
       "tblSKU"."ItemNo",
       "tblSKU"."SKUDesc",
       "tblSKU"."DCLoc",
       "tblSKU"."CategoryID",
       "tblSKU"."SKUClassID",
       "tblSKUClass"."SKUClassDesc"
FROM "tblSKU"
LEFT JOIN "tblSKUClass" ON "tblSKU"."SKUClassID" = "tblSKUClass"."SKUClassID"
RIGHT JOIN ( qryInventoryNegativeCheck2
            LEFT JOIN qryInventoryNegativeCheck1 ON qryInventoryNegativeCheck2."POID" = qryInventoryNegativeCheck1."POID"
            AND qryInventoryNegativeCheck2."SKUID" = qryInventoryNegativeCheck1."SKUID" ) ON "tblSKU"."SKUID" = qryInventoryNegativeCheck2."SKUID"
WHERE "POOrderRcvdQuant" ISNULL
  OR "SumOfOrderDeliveredQuant" ISNULL
;

