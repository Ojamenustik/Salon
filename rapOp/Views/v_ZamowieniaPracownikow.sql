CREATE VIEW [rapOp].[v_ZamowieniaPracownikow] AS
	SELECT pr.Imie, pr.Nazwisko, COUNT(z.ZamowienieId) AS Zamowienia, SUM(z.CenaZamowienia) AS Suma
	FROM [dbo].[Pracownik] AS pr WITH (NOLOCK)
	LEFT JOIN [dbo].[Zamowienie] AS z ON z.PracownikId= pr.PracownikId
	GROUP BY pr.PracownikId, pr.Imie, pr.Nazwisko