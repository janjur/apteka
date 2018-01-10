from flask_wtf import Form
from wtforms import TextAreaField, SubmitField, StringField


class ContactForm(Form):
    name = StringField("Imię")
    email = StringField("Email")
    subject = StringField("Temat")
    message = TextAreaField("Wiadomość")
    submit = SubmitField("Wyślij")