INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('1', 'Witamina C 1000, 20szt.', '6');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('2', 'Czosnek kapsulki, 60szt.', '14');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('3', 'Rozgrzewajaca herbata, 20szt.', '6');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('4', 'Woda morska, 100ml', '19');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('5', 'Tymianek i podbial pastylki, 24szt.', '9');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('6', 'Neorutin tabletki, 120szt.', '7');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('7', 'Tussimin syrop, 120ml', '10');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('8', 'Nebulizator C801', '189');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('9', 'Theraflu Zatoki, 14 szt.', '18');
INSERT INTO `Apteka`.`Towar` (`idTowar`, `Nazwa`, `Cena`) VALUES ('10', 'Ibupar Forte tabletki, 10szt.', '4');

INSERT INTO `Apteka`.`Klient` (`idKlient`, `Adres`) VALUES ('1', 'Warszawa');
INSERT INTO `Apteka`.`Klient` (`idKlient`, `Adres`) VALUES ('2', 'Wroclaw');
INSERT INTO `Apteka`.`Klient` (`idKlient`, `Adres`) VALUES ('3', 'Krakow');
INSERT INTO `Apteka`.`Klient` (`idKlient`, `Adres`) VALUES ('4', 'Wadowice');
INSERT INTO `Apteka`.`Klient` (`idKlient`, `Adres`) VALUES ('5', 'Katowice');

INSERT INTO `Apteka`.`Pracownik` (`idPracownik`, `Dzial`) VALUES ('1', '1');
INSERT INTO `Apteka`.`Pracownik` (`idPracownik`, `Dzial`) VALUES ('2', '3');
INSERT INTO `Apteka`.`Pracownik` (`idPracownik`, `Dzial`) VALUES ('3', '2');
INSERT INTO `Apteka`.`Pracownik` (`idPracownik`, `Dzial`) VALUES ('4', '2');
INSERT INTO `Apteka`.`Pracownik` (`idPracownik`, `Dzial`) VALUES ('5', '1');

INSERT INTO `Apteka`.`Platnosc` (`idPlatnosc`, `Sposob`, `Zaksiegowano`) VALUES ('1', '1', '0');
INSERT INTO `Apteka`.`Platnosc` (`idPlatnosc`, `Sposob`, `Zaksiegowano`) VALUES ('2', '1', '1');
INSERT INTO `Apteka`.`Platnosc` (`idPlatnosc`, `Sposob`, `Zaksiegowano`) VALUES ('3', '2', '1');
INSERT INTO `Apteka`.`Platnosc` (`idPlatnosc`, `Sposob`, `Zaksiegowano`) VALUES ('4', '3', '0');
INSERT INTO `Apteka`.`Platnosc` (`idPlatnosc`, `Sposob`, `Zaksiegowano`) VALUES ('5', '2', '1');

INSERT INTO `Apteka`.`Dostawa` (`idDostawa`, `Sposob`, `Adres`, `NrKontaktowy`) VALUES ('1', '1', 'Warszawa 155', '668758978');
INSERT INTO `Apteka`.`Dostawa` (`idDostawa`, `Sposob`, `Adres`, `NrKontaktowy`) VALUES ('2', '2', 'Krakow 42', '787845789');
INSERT INTO `Apteka`.`Dostawa` (`idDostawa`, `Sposob`, `Adres`, `NrKontaktowy`) VALUES ('3', '1', 'Zielona Gora 777', '857986589');

INSERT INTO `Apteka`.`Zamowienie` (`idZamowienie`, `Status`, `NrKontaktowy`, `Dostawa`, `Pracownik`, `Klient`, `Platnosc`) VALUES ('1', '1', '687894687', '1', '1', '1', '1');
INSERT INTO `Apteka`.`Zamowienie` (`idZamowienie`, `Status`, `NrKontaktowy`, `Dostawa`, `Pracownik`, `Klient`, `Platnosc`) VALUES ('2', '2', '687984795', '1', '1', '1', '2');
INSERT INTO `Apteka`.`Zamowienie` (`idZamowienie`, `Status`, `NrKontaktowy`, `Dostawa`, `Pracownik`, `Klient`, `Platnosc`) VALUES ('3', '4', '111111111', '2', '2', '2', '3');
INSERT INTO `Apteka`.`Zamowienie` (`idZamowienie`, `Status`, `NrKontaktowy`, `Dostawa`, `Pracownik`, `Klient`, `Platnosc`) VALUES ('4', '3', '123456789', '3', '4', '5', '2');

INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('2', 'szt', '8', '1');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('1', 'szt', '5', '1');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('4', 'szt', '1', '2');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('1', 'szt', '4', '2');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('10', 'szt', '2', '3');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('4', 'szt', '10', '4');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('13', 'szt', '4', '4');
INSERT INTO `Apteka`.`Ilosc` (`Ilosc`, `Jednostka`, `idTowar`, `idZamowienie`) VALUES ('20', 'szt', '7', '4');

-- Of course this has no sense from business perspective. There are not-delivered payments for finished shippings.

