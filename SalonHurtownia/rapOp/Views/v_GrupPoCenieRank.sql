CREATE VIEW rapOp.v_GrupPoCenieRank AS
SELECT NazwaMarki,  CenaProduktu, TypModelu, RANK() OVER(ORDER BY CenaProduktu DESC) as PriceRank
FROM Zamowienie WITH (NOLOCK)
WHERE TypModelu='Compact'