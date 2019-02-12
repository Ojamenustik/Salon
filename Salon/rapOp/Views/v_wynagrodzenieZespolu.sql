CREATE view rapOp.v_wynagrodzenieZespolu AS
--pokazuje sume wynagrodzenia każdego z zespołów
SELECT zp.Zespol, SUM(w.KwotaWynagrodzenia) as WynagrodzenieZespolu
FROM HR.ZespolPracownika AS zp with (READUNCOMMITTED)
INNER JOIN HR.Wynagrodzenie AS w ON zp.PracownikId = w.PracownikId
GROUP BY zp.Zespol