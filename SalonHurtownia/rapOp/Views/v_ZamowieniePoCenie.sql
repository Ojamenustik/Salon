CREATE VIEW rapOp.v_ZamowieniePoCenie AS
SELECT Zamowienie_Id, SUM(CenaZamowienia) SUMA
FROM (SELECT ROW_NUMBER() OVER (PARTITION BY Zamowienie_Id ORDER BY CenaZamowienia) AS rownum,
	Zamowienie_Id, CenaZamowienia
	FROM Zamowienie WITH (NOLOCK)) AS D
GROUP BY Zamowienie_Id