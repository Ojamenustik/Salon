CREATE VIEW [rapOp].[v_ZamowieniaZRabatem] AS
	SELECT z.*, ((c.Cena - z.CenaZamowienia) / c.Cena) AS Rabat
	FROM [dbo].[Zamowienie] AS z WITH (NOLOCK)
	INNER JOIN [dbo].[Cennik] AS c ON z.ModelId = c.ModelId
	WHERE z.DataZamowienia > c.ObowiazujeOd AND z.DataZamowienia < c.ObowiazujeDo