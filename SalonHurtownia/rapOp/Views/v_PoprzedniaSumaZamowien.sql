CREATE VIEW rapOp.v_PoprzedniaSumaZamowien AS
SELECT Zamowienie_Id, YEAR(DataZamowienia) AS ROK, SUM(CenaZamowienia) AS SUMA, LAG(SUM(CenaZamowienia)) OVER(ORDER BY Zamowienie_Id, YEAR(DataZamowienia)) AS PoprzedniaSuma
FROM Zamowienie
GROUP BY Zamowienie_Id, YEAR(DataZamowienia)
ORDER BY Zamowienie_Id, YEAR(DataZamowienia) OFFSET 1 ROW FETCH NEXT 5 ROWS ONLY