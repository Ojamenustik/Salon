INSERT INTO Adres(Ulica, Budynek, NrMieszkania, Miasto, Kraj, KodPocztowy) VALUES
('sw.Anny'	,5	,10,	'Kraków',	'Polska',	'30-081'),
('sw.Franciszka',	6	,12,	'Kraków',	'Polska',	'30-881'),
('sw.Tomasza',	8	,21,	'Warszawa',	'Polska'	,'32-081'),
('sw.Elzbiety',	13	,25,'Gdansk'	,'Polska',	'39-481'),
('sw.Jana'	,89	,2,	'Kraków'	,'Polska'	,'30-984'),
('sw.Joanny'	,43	,33,	'Tarnów',	'Polska'	,'36-255'),
('Grunwaldzka',	64	,23,	'Tarnów'	,'Polska'	,'12-087'),
('Pawia'	,13	,11	,'Kraków',	'Polska'	,'83-125'),
('Nowy Swiat'	,27	,10,	'Warszawa',	'Polska',	'30-777'),
('Przemyslowa',	3	,15	,'Lublin',	'Polska',	'42-341'),	
('św.Anny', '12',	1,	'Kraków',	'Polska', '30-181'),
('św.Franciszka', '16',	2,	'Poznań',	'Polska', '30-181'),
('św.Tomasza', '18',	2,	'Warszawa',	'Polska', '31-081'),
('św.Elżbiety', '3',	5,	'Gdańsk',	'Polska', '31-481'),
('św.Jana', '9',	12,	'Zamość',	'Polska', '30-914'),
('św.Joanny', '33',	23,	'Kielce',	'Polska', '36-215'),
('Grunwaldzka', '4',	31,	'Katowice',	'Polska', '11-087'),
('Pawia', '13',	11,	'Kraków',	'Polska', '83-125'),
('Nowy Świat', '27',	10,	'Warszawa',	'Polska', '30-777'),
('Przemysłowa', '3',	15,	'Lublin',	'Polska', '42-341')
GO

INSERT INTO Marka(MarkaId,KodMarki, Nazwa, Kraj ) VALUES
	('C001', 'Cadillac',	'Cadillac Motor Car Division',	'USA'),
	('M001', 'Mercedes',	'Mercedes Benz',				'Germany'),
	('B001', 'BMW',			'Bayerische Motoren Werke',		'Germany'),
	('A001', 'Acura',		'Acura',						'Japan'),
	('D001', 'Dacia',		'Automobile Dacia',				'Rumania'),
	('A101', 'Audi',		'Audi',							'Germany'),
	('F001', 'Fiat',		'Fabbrica Italiana Automobili Torino',	'Italy'),
	('C101', 'Chevrolet',	'Chevrolet',					'USA'),
	('R001', 'Renault',		'Renault',						'France'),
	('B101', 'Bentley',		'Bentley Motors Limited',		'United Kingdom'),
	('O001', 'Opel',		'Opel Automobile GmbH',			'Germany');
GO

INSERT INTO Klient (Imie, Nazwisko, Mail, Telefon, NrDowoduOsobistego, NIP, Adres) VALUES
	('Ada',			'Zaciewska', 'azaciewska@gmail.com', '999999999',	'980102334',	'SCK266055',	1),
	('Adam',		'Padiasek',	'apadiasek@gmail.com','999555999','980765334',	'QUU993739',	2),
	('Adela',		'Babciak',	'ababciak@gmail.com','999666999','876102334',	'NPY895136',	3),
	('Adrianna',	'Babakow','ababakow@gmail.com','999999888',	'980102111',	'LPW290371',	4),
	('Aga',		'Baczyk','abaczyk@gmail.com',	'112999999','980102556',	'XUL306816',	5),
	('Bolesław',		'Nachman','bnachamn@gmail.com','456999999',	'980102889',		'JBK260422',	6),
	('Danuta',		'Nocula','dnocula@gmail.com',	'999956549','980102160',		'SCK266155',	7),
	('Daria',		'Nowak','dnowak@gmail.com',	'556754345','411102334',		'SCK266222',	7),
	('Eryk',		'Wąsowski',	'ewasowki@gmail.com',	'99999111',	'822102334','NPP895136',	7),
	('Paula',		'WNosek',	'pnosek@gmail.com',	'99995701',	'822144534','NPP898656',	9),
	('Daniel',		'Wożnik','dwaznik@gmail.com',	'999112999','970101334',	'KKE22047',	8);
GO

INSERT INTO Pracownik (Imie, Nazwisko, Telefon, PESEL, Adres, Mail, DataZatrudnienia) VALUES
	('Marcin',		'Koń',		'850630774','97021355561', 17, 'mkon@gmail.com', '2018-01-5'),
	('Anna',	'Brokoli',		'880109237','98031454562',10,'abrokoli@gmail.com','2018-01-5'),
	('Andrzej',		'Krzak',		'980602287','98041654563',	 11,'akrzak@gmail.com','2018-07-1'),
	('Krzysztof',	'Bielas',		'690515372','99051855564', 12, 'kbielasn@gmail.com','2018-06-1'),
	('Zuzanna',	'Kret',		'950626572','94061956565',13,'zkretn@gmail.com','2018-08-1'),
	('Kacper',	'Szczygieł',		'790529217','92072357566', 14,'kszczyg@gmail.com','2018-01-5'),
	('Anita',		'Bąk',		'750407874','91082555567', 15,'abak@gmail.com','2018-01-5'),
	('Łucja',		'Niebo',		'841103593','91090255561',	16,'lnieboo@gmail.com','2018-01-5');
GO



INSERT INTO Model (Nazwa, Typ, Paliwo, Wyposazenie, Kolor, Dostepnosc, Marka)
VALUES
		('Mercedes',		'Compact',		'Diesel',			'skórzana tapicerka',	'Czerwony',	1,	'M001'	),
		('Acura',			'Compact',	'Premium Unleaded',	'skórzana tapicerka, asystent parkowania',	'Czerwony',	1,'A001'),
		('Acura',		'Compact',	'Premium Unleaded','skórzana tapicerka, kamera',	'Czerwony',	1,'A001'	),
		('Fiat',	'SUV',			'Premium Unleaded',	'skórzana tapicerka',	'Czerwony',	1,'F001'),
		('Fiat',			'SUV',		'Premium Unleaded',	'skórzana tapicerka, automatyczne światła',	'Niebieski',	1,	'F001'),
		('Bentley',			'SUV',		'Premium Unleaded',	'skórzana tapicerka, tempomat',	'Biały',	1,	'B101'	),
		('Bentley',			'Sedan',	'Premium Unleaded',	'skórzana tapicerka, gps',	'Czarny',	1,	'B101'	),
		('BMW',			'Coupe',		'Premium Unleaded',	'automatyczna klapa bagażnika',	'Czerwony',	1,	'B001'	),
		('Dacia',			'Sedan',	'Premium Unleaded',	'skórzana tapicerka, podgrzewane fotele',	'Czarny',	1,	'D001'	),
		('BMW',				'Sedan',	'Diesel',			'skórzana tapicerka, gps,podgrzewane fotele ',	'Czerwony',	1,'B001'),
		('Cadillac',		'Sedan',	'Premium Unleaded',	'skórzana tapicerka, gps',	'Czerwony',	1,	'C001'	),
		('Cadillac',		'Coupe',	'Premium Unleaded',	'skórzana tapicerka,asystent parkowania, gps',	'Czarny',	1,'C001'	),
		('Chevrolet',		'SUV',		'Diesel',			'skórzana tapicerka',	'Czarny',	1,	'C101')


INSERT INTO [HR].[Zespol] VALUES
	('Halo'),
	('Cisok'),
	('BenQ'),
	('FastFurious')
GO

INSERT INTO [HR].[ZespolPracownika]
	VALUES 
		(9,	'Halo'),
		(10,	'Cisok'),
		(11,	'Halo'),
		(12,	'Cisok'),
		(13,	'Halo'),
		(14,	'FastFurious'),
		(15,	'BenQ'),
		(16,	'BenQ')
	


INSERT INTO [HR].[Stanowisko] VALUES
	('Konsultant'),
	('Mechanik'),
	('CEO');
GO

INSERT INTO [HR].[StanowiskoPracownika]
	VALUES 
		(9,	'Konsultant',	'2018-01-5', null),
		(10,	'Konsultant',	'2018-01-5', null),
		(11,	'Konsultant',	'2018-07-1', null),
		(12	,'Mechanik',		'2018-06-1', null),
		(13,	'Konsultant',		'2018-08-1', '2018-10-31'),
		(14	,'Mechanik',		'2018-11-1', null),
		(15,	'Mechanik',		'2018-01-5', null),
		(16,	'CEO',		'2018-01-5', '2018-11-30')


INSERT INTO [HR].[Wynagrodzenie] 
	VALUES 
		(9,	3500,	'2018-01-5',	null),
		(10,	3740,	'2018-02-5',	null),
		(11,	4000,	'2018-07-1',	'2019-05-31'),
		(12,	5500,	'2018-05-1',	'2019-05-1'),
		(13,	2000,	'2018-09-1',	null),
		(14,	4300,	'2017-11-5',	null),
		(15,	4500,	'2018-01-5',	null),
		(16,	5700,	'2018-05-5',	null)
		
INSERT INTO Serwis.[Status] VALUES
	('Przyjeto'),
	('W trakcie'),
	('Zakonczono'),
	('Odebrano');
GO

INSERT INTO Serwis.Usluga VALUES
	(	'Wymiana lampy'),
	('Wymiana silnika'),
	(	'Wymiana oleju'),
	(	'Przegląd samochodu'),
	('Lakierowanie nadwozia'),
	(	'Kasowanie błędów komputera'),
	(	'Wymiana opon'),
	('Wymiana klocków hamulcowych'),
	(	'Wymiana tarcz hamulcowych'),
	(	'Remont silnika'),
	(	'Naprawa klimatyzacji');
GO