CREATE view rapOp.v_iloscKazdejUslugi AS
--pokazuje ilość usług, które zostały wykonane 
select u.UslugaNazwa, COUNT(z.ZamowienieId) AS iloscWykonanejUslugi 
from Serwis.Usluga u with (READUNCOMMITTED)
JOIN Serwis.Zamowienie z ON u.UslugaId = z.UslugaId
group by UslugaNazwa