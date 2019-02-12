CREATE view rapOp.v_najwyzszaPremia AS
--pokazuje zespół, id pracownika, nazwisko pracownika, który ma największą premię
SELECT zp.Zespol, p.PracownikId, p.Nazwisko, MAX(w.KwotaWyplaty) as NajPremia
FROM HR.ZespolPracownika AS zp with (READUNCOMMITTED)
INNER JOIN HR.[Wyplata] AS w ON zp.PracownikId = w.PracownikId
INNER JOIN Pracownik p ON p.PracownikId=zp.PracownikId
WHERE TypWyplaty='premia'
GROUP BY zp.Zespol, zp.Zespol, p.PracownikId, p.Nazwisko