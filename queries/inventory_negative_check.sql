create view vw_inventory_negative_check as

WITH

qryInventoryNegativeCheck1 AS (
SELECT "tblPurchaseOrderItems"."POID",
       "tblPurchaseOrderItems"."SKUID",
       "tblPurchaseOrderItems"."POOrderRcvdQuant"
FROM "tblPurchaseOrderItems"
),

qryInventoryNegativeCheck2 as (
SELECT "tblOrderItems"."SKUID",
       "tblOrderItems"."POID",
       Sum("tblOrderItems"."OrderDeliveredQuant") AS "SumOfOrderDeliveredQuant"
FROM "tblOrderItems"
GROUP BY "tblOrderItems"."SKUID",
         "tblOrderItems"."POID"
ORDER BY "tblOrderItems"."SKUID"
)

SELECT qryInventoryNegativeCheck1."SKUID",
       qryInventoryNegativeCheck1."POID",
       "POOrderRcvdQuant" - COALESCE("SumOfOrderDeliveredQuant", 0) AS "Quant",
        "tblSKU"."Manf",
        "tblSKU"."ItemNo",
        "tblSKU"."SKUDesc",
        "tblSKU"."DCLoc",
        "tblSKU"."CategoryID",
        "tblSKU"."SKUClassID",
        "tblSKUClass"."SKUClassDesc"
FROM qryInventoryNegativeCheck2
  RIGHT JOIN qryInventoryNegativeCheck1
        ON (qryInventoryNegativeCheck2."POID"  = qryInventoryNegativeCheck1."POID")
       AND (qryInventoryNegativeCheck2."SKUID" = qryInventoryNegativeCheck1."SKUID")
   LEFT JOIN "tblSKU"      ON qryInventoryNegativeCheck1."SKUID" = "tblSKU"."SKUID"
   LEFT JOIN "tblSKUClass" ON "tblSKU"."SKUClassID" = "tblSKUClass"."SKUClassID"
 WHERE
  ("POOrderRcvdQuant" - COALESCE("SumOfOrderDeliveredQuant",0)) < 0
;
