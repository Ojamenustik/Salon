CREATE VIEW rapOp.v_GroupingSetPracData AS
SELECT Pracownik_Id, COUNT(z.Zamowienie_Id) OrderNum, YEAR(DataZamowienia) AS ROK
FROM Zamowienie z WITH (NOLOCK)
GROUP BY GROUPING SETS(
(Pracownik_Id, YEAR(DataZamowienia)),
(Pracownik_Id),
(YEAR(DataZamowienia)),());