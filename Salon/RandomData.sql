DECLARE @dateFrom AS DATE = '20190101'; 
DECLARE @dateTo AS DATE = DATEADD(DAY, 30, @dateFrom);
WHILE @dateFrom < GETDATE()
	BEGIN
		INSERT INTO [dbo].[Cennik] (ModelId, Cena, ObowiazujeOd, ObowiazujeDo)
		SELECT 
			m.ModelId,
			ABS(FLOOR(RAND()*(500)))*10,
			@dateFrom,
			@dateTo
		FROM
			[dbo].[Model] AS m
		SET @dateFrom = @dateTo;
		SET @dateTo = DATEADD(DAY, 30,@dateFrom);
	END;
GO
select * from Cennik

DECLARE @data AS DATE = '20190101';
WHILE @data < GETDATE()
	BEGIN
		DECLARE @ModelId AS INT = (SELECT TOP 1 ModelId FROM [dbo].[Model] ORDER BY NEWID());
		DECLARE @PracownikId AS INT = (SELECT TOP 1 PracownikId FROM [HR].[StanowiskoPracownika] AS sp WHERE sp.ZajmowaneStanowisko = 'Konsultant' ORDER BY NEWID());
		DECLARE @KlientId AS INT = (SELECT TOP 1 KlientId FROM [dbo].[Klient] ORDER BY NEWID());

		INSERT INTO [dbo].[Zamowienie] (ModelId, PracownikId, KlientId, CenaZamowienia, DataZamowienia, DataOdbioru, Zrealizowane, Oplacone)
		SELECT 
			c.ModelId,
			@PracownikId,
			@KlientId,
			c.Cena,
			@data,
			@data,
			1,
			1
		FROM
			Cennik c
		WHERE 
			c.ModelId = @ModelId
			AND c.ObowiazujeOd <= @data
			AND c.ObowiazujeDo > @data

		SET @data = DATEADD(DAY, 1, @data);
	END;
GO


WHILE (SELECT COUNT(*) FROM Serwis.Zamowienie) < 50
	BEGIN
		DECLARE @ModelID AS INT = (SELECT TOP 1 ModelId FROM [dbo].[Zamowienie] ORDER BY NEWID());
		DECLARE @UslugaID AS INT = (SELECT TOP 1 UslugaId FROM Serwis.Usluga ORDER BY NEWID());
		
		INSERT INTO Serwis.Zamowienie ([ModelId],[UslugaId],[ZamowienieCena])
		VALUES (@ModelId,
				@UslugaID,
				FLOOR(RAND(CAST( NEWID() AS varbinary))*(1800-100)+100)
				)
	END
GO

DECLARE @data AS DATE = '20190101';
WHILE @data < GETDATE()
WHILE (SELECT COUNT(*) FROM Serwis.HistoriaZamowienia) < (SELECT COUNT(*) FROM Serwis.Zamowienie) 
	BEGIN
		DECLARE @ZamowienieId AS INT = (SELECT TOP 1 ZamowienieId FROM [dbo].[Zamowienie] ORDER BY NEWID());
		DECLARE @PracownikId AS INT = (SELECT TOP 1 PracownikId FROM [dbo].Pracownik ORDER BY NEWID());
		DECLARE @Status AS nvarchar(20)
		DECLARE @amount INT = 200
		 	
			IF (@amount % 2 = 1) SET @Status = 'W trakcie'
			ELSE SET @Status = 'Zakonczono'
			

		INSERT INTO Serwis.HistoriaZamowienia (ZamowienieId,PracownikId,[Status],HistoriaZamowieniaData)
		VALUES(@ZamowienieId,
				@PracownikId,
				@Status,
				@data)
		SET @data = DATEADD(DAY, 1, @data);
		SET @amount = 200 - FLOOR(RAND(CAST( NEWID() AS varbinary))*(200-1)+1)
	END
GO
