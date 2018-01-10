from flask_wtf import Form
from wtforms import TextAreaField, SubmitField, StringField, RadioField


class ContactForm(Form):
    name = StringField("Imię")
    email = StringField("Email")
    subject = StringField("Temat")
    message = TextAreaField("Wiadomość")
    submit = SubmitField("Wyślij")


class AddressForm(Form):
    zaplata = RadioField("Radio", choices=[('blik', 'Blik'),
                                           ('karta', 'Karta Płatnicza'),
                                           ('przelew', 'Przelew tradycyjny')], )

    surname = StringField("Imię i nazwisko")
    address = StringField("Adres")
    city = StringField("Miasto")
    country = StringField("Kraj")
    submit = SubmitField("Wyślij")
