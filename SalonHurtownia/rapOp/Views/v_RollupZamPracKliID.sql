CREATE VIEW rapOp.v_RollupZamPracKliID AS
SELECT Zamowienie_Id, Pracownik_Id, Klient_Id, COUNT(z.Zamowienie_Id) OrderNum
FROM Zamowienie z WITH (NOLOCK)
GROUP BY ROLLUP(Zamowienie_Id, Pracownik_Id, Klient_Id)