CREATE OR REPLACE VIEW qryPreOrderPOHistAU2 AS

SELECT qryPreOrderPOHistAU.PODate,
       qryPreOrderPOHistAU.SKUID,
       qryPreOrderPOHistAU.SplrID2,
       qryPreOrderPOHistAU.SplrName,
       qryPreOrderPOHistAU.POOrderQuant,
       qryPreOrderPOHistAU.POOrderRcvdQuant,
       qryPreOrderPOHistAU.PODiff,
       qryPreOrderPOHistAU.POOrderPricePer,
       qryPreOrderPOHistAU.PriceEachLessTax,
       qryPreOrderPOHistAU.POID,
       Sum(tblOrderItems.OrderQuant) AS SumOfOrderQuant,
       Sum(tblOrderItems.OrderDeliveredQuant) AS SumOfOrderDeliveredQuant,
       qryPreOrderPOHistAU.POOrderExpiration
FROM tblOrderItems
RIGHT JOIN qryPreOrderPOHistAU ON (tblOrderItems.SKUID = qryPreOrderPOHistAU.SKUID)
AND (tblOrderItems.POID = qryPreOrderPOHistAU.POID)
GROUP BY qryPreOrderPOHistAU.PODate,
         qryPreOrderPOHistAU.SKUID,
         qryPreOrderPOHistAU.SplrID2,
         qryPreOrderPOHistAU.SplrName,
         qryPreOrderPOHistAU.POOrderQuant,
         qryPreOrderPOHistAU.POOrderRcvdQuant,
         qryPreOrderPOHistAU.PODiff,
         qryPreOrderPOHistAU.POOrderPricePer,
         qryPreOrderPOHistAU.PriceEachLessTax,
         qryPreOrderPOHistAU.POID,
         qryPreOrderPOHistAU.POOrderExpiration;

