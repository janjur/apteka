from flask import Flask, render_template, redirect, flash, url_for, request
from flask_sqlalchemy import SQLAlchemy

from forms import ContactForm, AddressForm
from models import *

app = Flask('Apteka')  # create flask app
app.config.from_object('config')  # quick configuration from file config.py
db = SQLAlchemy(app)  # connect database with interface provided by sqlalchemy


@app.route('/', methods=['GET', 'POST'])
@app.route('/index', methods=['GET', 'POST'])
# This function can be accesed at / and /index adresses with GET and POST methods. Default metho is GET.
def index():
    towary = db.session.query(Towar).order_by(Towar.idTowar).all()
    ilosc = sum(koszyczek.values())
    return render_template('main.html', towary=towary, ilosc=ilosc)


@app.route('/add/<int:id>')
def add_to_cart(id):
    koszyczek[id] = koszyczek.get(id, 0) + 1
    towar_do_dodania = db.session.query(Towar).filter_by(idTowar=id).one()

    flash(f'Dodano do koszyka towar "{towar_do_dodania.Nazwa}".')

    return redirect(url_for('index'))


@app.route('/cart')
def koszyk():
    towary = []
    for towar_w_koszyku in koszyczek:
        towarek = db.session.query(Towar).filter_by(idTowar=towar_w_koszyku).one()
        towarek.Ilosc = koszyczek[towar_w_koszyku]
        towary.append(towarek)

    ilosc = sum(koszyczek.values())

    for towar in towary:
        towar.cena_laczna = towar.Cena * towar.Ilosc

    cena_calkowita = sum([towar.cena_laczna for towar in towary])

    return render_template('koszyk.html', towary=towary, ilosc=ilosc, cena_calkowita=cena_calkowita)


@app.route('/remove/<int:id>')
def remove_from_cart(id):

    del(koszyczek[id])
    towar_do_usuniecia = db.session.query(Towar).filter_by(idTowar=id).one()

    flash(f'Usunięto z koszyka towar "{towar_do_usuniecia.Nazwa}".')

    return redirect(url_for('koszyk'))


@app.route('/remove_all/')
def remove_all_from_cart():
    global koszyczek
    koszyczek = {}

    flash('Usunięto towary z koszyka.')

    return redirect('index')


@app.route('/checkout', methods=['GET', 'POST'])
def checkout():
    global koszyczek
    cena = sum([koszyczek[towar.idTowar] * towar.Cena  # sążnie
                 for towar
                 in db.session.query(Towar).order_by(Towar.idTowar).all()
                 if towar.idTowar in koszyczek])
    ilosc = sum(koszyczek.values())
    form = AddressForm()

    if request.method == 'POST':
        flash('Zamówienie zrealizowane.')
        with open('PAYMENTS', 'a') as f:
            f.write(f'Wybrano opcję zapłaty {form.zaplata.data}. Odbiorca: {form.surname.data}. '
                    f'Adres: {form.address.data}, {form.city.data}, {form.country.data}. \n\n')
        koszyczek = {}
        return redirect('index')

    return render_template('kasa.html', cena=cena, ilosc=ilosc, form=form)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    form = ContactForm()
    ilosc = sum(koszyczek.values())

    if request.method == 'POST':
        flash('Wiadomość przkazana pracownikowi.')
        with open('MESSAGES', 'a') as f:
            f.write(f'{form.name.data} o adresie {form.email.data} pisze: "{form.message.data}"\n\n')
        return redirect('index')

    return render_template('contact.html', form=form, ilosc=ilosc)


koszyczek = {}
app.run(host='localhost', port=8080, debug=True)