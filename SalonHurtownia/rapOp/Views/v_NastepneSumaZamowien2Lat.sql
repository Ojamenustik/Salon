CREATE VIEW rapOp.v_NastepneSumaZamowien2Lat AS
SELECT Zamowienie_Id, YEAR(DataZamowienia) AS ROK, SUM(CenaZamowienia) AS SUMA, LEAD(SUM(CenaZamowienia),2,0) OVER(ORDER BY Zamowienie_Id, YEAR(DataZamowienia)) AS SumaPoprz2Lat
FROM Zamowienie
GROUP BY Zamowienie_Id, YEAR(DataZamowienia)
ORDER BY Zamowienie_Id, YEAR(DataZamowienia) OFFSET 1 ROW FETCH NEXT 5 ROWS ONLY