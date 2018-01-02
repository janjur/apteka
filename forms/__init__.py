from flask_wtf import Form
from wtforms import StringField


class NewContentForm(Form): # Forms for submitting data
    content = StringField('content')


class LoginForm(Form):
    login = StringField('Login')
    password = StringField('Password')


class RegisterForm(Form):
    newlogin = StringField('Login')
    newpassword = StringField('Password')
