from sqlalchemy import Column, INTEGER, VARCHAR, ForeignKey, BOOLEAN
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mysql import ENUM
import sqlalchemy

from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Dostawa(Base):
    __tablename__ = 'Dostawa'
    idDostawa = Column(INTEGER, primary_key=True, nullable=False)
    Sposob = Column(ENUM('kurier', 'paczkomat', 'pocztaPolska', 'odbiorOsobisty'))
    Adres = Column(VARCHAR(200))
    NrKontaktowy = Column(VARCHAR(200))

    zamowienia = relationship("Zamowienie", back_populates='dostawa')


class Pracownik(Base):
    __tablename__ = 'Pracownik'
    idPracownik = Column(INTEGER, primary_key=True, nullable=False)
    Dzial = Column(ENUM('Sprzedaz', 'ObslugaKlienta', 'Marketing'))

    zamowienia = relationship("Zamowienie", back_populates='pracownik')


class Klient(Base):
    __tablename__ = 'Klient'
    idKlient = Column(INTEGER, primary_key=True, nullable=False)
    Adres = Column(VARCHAR(200))

    zamowienia = relationship("Zamowienie", back_populates='klient')


class Platnosc(Base):
    __tablename__ = 'Platnosc'
    idPlatnosc = Column(INTEGER, primary_key=True, nullable=False)
    Sposob = Column(ENUM('PayU', 'PrzelewOnline', 'PrzelewTradycyjny'))
    Zaksiegowano = Column(BOOLEAN)

    zamowienia = relationship("Zamowienie", back_populates='platnosc')


class Zamowienie(Base):
    __tablename__ = 'Zamowienie'
    idZamowienie = Column(INTEGER, primary_key=True, nullable=False)
    Status = Column(ENUM('Tworzone', 'Zlozone', 'Oplacone', 'Wyslane'))
    NrKontaktowy = Column(VARCHAR(200))

    Dostawa = Column(INTEGER, ForeignKey('Dostawa.idDostawa'), nullable=False)
    dostawa = relationship("Dostawa", back_populates="zamowienia")

    Pracownik = Column(INTEGER, ForeignKey('Pracownik.idPracownik'), nullable=True)
    pracownik = relationship("Pracownik", back_populates="zamowienia")

    Klient = Column(INTEGER, ForeignKey('Klient.idKlient'), nullable=True)
    klient = relationship("Klient", back_populates="zamowienia")

    Platnosc = Column(INTEGER, ForeignKey('Platnosc.idPlatnosc'), nullable=True)
    platnosc = relationship("Platnosc", back_populates="zamowienia")

    ilosc = relationship("Ilosc", back_populates='zamowienie')


class Towar(Base):
    __tablename__ = 'Towar'
    idTowar = Column(INTEGER, primary_key=True, nullable=False)
    Nazwa = Column(VARCHAR(200))
    Cena = Column(INTEGER)
    ilosc = relationship("Ilosc", back_populates='towar')


class Ilosc(Base):
    __tablename__ = 'Ilosc'
    Ilosc = Column(VARCHAR(200))
    Jednostka = Column(VARCHAR(200))

    idTowar = Column(INTEGER, ForeignKey('Towar.idTowar'), primary_key=True)
    towar = relationship("Towar", back_populates="ilosc")

    idZamowienie = Column(INTEGER, ForeignKey('Zamowienie.idZamowienie'), primary_key=True)
    zamowienie = relationship("Zamowienie", back_populates="ilosc")


if __name__ == '__main__':
    engine = sqlalchemy.create_engine('mysql+pymysql://root:pw@0.0.0.0:3306/Apteka')
    Base.metadata.create_all(engine)










class Koszyk(Base):
    __tablename__ = 'Koszyk'
    idTowar = Column(INTEGER, primary_key=True, nullable=False)
    Nazwa = Column(VARCHAR(200))
    Cena = Column(INTEGER)
    Ilosc = Column(INTEGER)