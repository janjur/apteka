from datetime import datetime

from flask import Flask, render_template, redirect, flash, url_for, request, g, session
from flask_sqlalchemy import SQLAlchemy

from models import User, Role, Post, Comment
from forms import RegisterForm, LoginForm, NewContentForm

app = Flask('wieloblog')  # create flask app
app.config.from_object('config')  # quick configuration from file config.py
db = SQLAlchemy(app)  # connect database with interface provided by sqlalchemy


@app.before_request # Triggered BEFORE each request. Just checking if user is logged in
def before_request():
    if 'user' in session:
        user = db.session.query(User).filter_by(Login=session['user']).one()
    else:
        user = User()
        user.Login = ''

    g.user = user


@app.route('/', methods=['GET', 'POST'])
@app.route('/index', methods=['GET', 'POST'])
# This function can be accesed at / and /index adresses with GET and POST methods. Default metho is GET.
def index():
    form = LoginForm(request.form)  # Prepare login, register and new_post form. May not be used.
    form2 = NewContentForm(request.form)
    form3 = RegisterForm(request.form)

    if request.method == 'POST':  # If /index accessed with POST method (by clicking button next to one of forms)
        if form.login.data:  # check, which form has sent data. If first, process with login
            login = form.login.data
            password = form.password.data
            try:
                user = db.session.query(User).filter_by(Login=login).one()
            except:
                flash('No user of login {}!'.format(login))
            else:
                if user.Password == password:
                    session["user"] = user.Login
                    flash('Logged in as {}'.format(user.Login))  # flash is used in home.html to list completed actions
                else:
                    flash('Incorrect password for user {}. Correct password is {}.'.format(login, user.Password))
        elif form2.content.data:  # If second, add new post
            new_post = Post(Content=form2.content.data, CreationDate=datetime.utcnow(),
                            Author=g.user.idUsers)
            db.session.add(new_post)
            db.session.commit()
            flash('Post added!')
        elif form3.newlogin.data:  # Or add new user with 'normal' role
            new_user = User(Login=form3.newlogin.data, CreationDate=datetime.utcnow(),
                            Password=form3.newpassword.data, UserRole=1)
            db.session.add(new_user)
            db.session.commit()
            flash('User added!')

        return redirect(url_for('index'))  # After processing POST request, refresh page with GET method, normally.

    posts = db.session.query(Post).order_by(Post.CreationDate.desc()).all()

    for post in posts:  # Prepare shortened version of post
        if len(post.Content.split(' ')) > 7:
            post.brief_content = ' '.join(post.Content.split(' ')[:7])+'...'
        else:
            post.brief_content = post.Content

    return render_template('main.html', posts=posts, form=form, form2=form2, form3=form3)


@app.route('/logout_handle', methods=['GET'])
def logout_handle():    # If logged in, home.html template gives access to link to logout.
                        # Logging out is just deleting user key from session dictionary
    del(session['user'])
    flash('Logged out')
    return redirect(url_for('index'))


@app.route('/user/<string:Login>')  # i.e /user/john will invoke user function with Login='john' parameter
def user(Login):
    user = db.session.query(User).filter_by(Login=Login).one()
    status = db.session.query(Role).filter_by(idRoles=user.UserRole).one()
    posts = user.posts
    comments = user.comments

    for comment in comments:
        comment.parent_content = comment.parent.Content

    #  And user function will return rendered html page and browser will display it
    return render_template('user.html', user=user, status=status.RoleName, posts=posts, comments=comments)


@app.route('/post/<string:idPost>', methods=['GET', 'POST'])
def post(idPost):

    post = db.session.query(Post).filter_by(idPosts=idPost).one()
    comments = post.comments

    form = NewContentForm(request.form)
    if request.method == 'POST':
        author = g.user

        new_comment = Comment(Content=form.content.data, CreationDate=datetime.utcnow(),
                              Author=author.idUsers, ParentPost=post.idPosts)
        db.session.add(new_comment)
        db.session.commit()
        flash('Comment added!')
        return redirect(url_for('post', idPost=idPost))

    if len(post.Content) > 15:
        post.title = post.Content[:15]+'...'
    else:
        post.title = post.Content

    return render_template('post.html',
                           title=post.title,
                           post=post,
                           comments=comments,
                           form=form)

app.run(host='localhost', port=8080, debug=True)  # Finally, after all these years, run prepared flask application
