from flask import Blueprint, render_template, request, current_app, session, flash, redirect, url_for
from werkzeug.security import check_password_hash
from db_utils import execute_and_fetch
from sql_provider import SQL_Provider


bp_auth = Blueprint('bp_auth', __name__, template_folder='templates', static_folder='static')
provider = SQL_Provider('./sql')


@bp_auth.route('/', methods=['GET', 'POST'])
def login_page():
    if request.method == 'GET':
        return render_template('auth.html')
    else:
        login = request.form.get('login')
        password = request.form.get('password')
        #задать вопрос насчет sql инъекции, например test_user'); DROP TABLE external_users; --
        sql = provider.get_sql('auth.sql', login=login)
        result = execute_and_fetch(current_app.config['DB_CONFIG'], sql)
        if not result:
            flash('Пользователь не найден', 'error')
            return render_template('auth.html')
        if not check_password_hash(result[0]['password'], password):
            flash('Неверный пароль', 'error')
            return render_template('auth.html')
        session['group_name'], session['login'] = result[0]['user_group'], result[0]['login']
        session['user_id'] = result[0]['user_id']
        flash(f"Вы авторизовались как {session['login']}", 'success')
        return redirect(url_for('home_page'))

@bp_auth.route('/logout')
def logout():
    session.pop('group_name', None)
    session.pop('login', None)
    session.pop('user_id', None)
    flash('Вы вышли из аккаунта', 'success')
    return redirect(url_for('home_page'))
