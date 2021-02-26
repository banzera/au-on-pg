CREATE OR REPLACE VIEW qrySKUPOHistAU2 AS
-- Query: qrySKUPOhistAU2
SELECT qrySKUPOHistAU.PODate,
       qrySKUPOHistAU.SKUID,
       qrySKUPOHistAU.SplrID2,
       qrySKUPOHistAU.SplrName,
       qrySKUPOHistAU.POOrderQuant,
       qrySKUPOHistAU.POOrderRcvdQuant,
       qrySKUPOHistAU.PODiff,
       qrySKUPOHistAU.POOrderPricePer,
       qrySKUPOHistAU.PriceEachLessTax,
       qrySKUPOHistAU.POID,
       Sum(tblOrderItems.OrderQuant) AS SumOfOrderQuant,
       Sum(tblOrderItems.OrderDeliveredQuant) AS SumOfOrderDeliveredQuant,
       qrySKUPOHistAU.POOrderExpiration
FROM qrySKUPOHistAU
LEFT JOIN tblOrderItems ON (qrySKUPOHistAU.POID = tblOrderItems.POID)
AND (qrySKUPOHistAU.SKUID = tblOrderItems.SKUID)
GROUP BY qrySKUPOHistAU.PODate,
         qrySKUPOHistAU.SKUID,
         qrySKUPOHistAU.SplrID2,
         qrySKUPOHistAU.SplrName,
         qrySKUPOHistAU.POOrderQuant,
         qrySKUPOHistAU.POOrderRcvdQuant,
         qrySKUPOHistAU.PODiff,
         qrySKUPOHistAU.POOrderPricePer,
         qrySKUPOHistAU.PriceEachLessTax,
         qrySKUPOHistAU.POID,
         qrySKUPOHistAU.POOrderExpiration;

