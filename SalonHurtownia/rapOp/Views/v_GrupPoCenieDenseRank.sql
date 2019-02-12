CREATE VIEW rapOp.v_GrupPoCenieDenseRank AS
SELECT NazwaMarki,  CenaProduktu, TypModelu, DENSE_RANK() OVER(ORDER BY CenaProduktu DESC) as PriceRank
FROM Zamowienie WITH (NOLOCK)
WHERE TypModelu='Compact'