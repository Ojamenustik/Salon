CREATE VIEW rapOp.v_ZamowienieData AS
SELECT Zamowienie_Id, DataZamowienia
FROM (SELECT ROW_NUMBER() OVER (PARTITION BY Zamowienie_Id ORDER BY CenaZamowienia) AS rownum,
	Zamowienie_Id, DataZamowienia
	FROM Zamowienie WITH (NOLOCK)) AS D
WHERE rownum >2