from calendar import month

from flask import Blueprint, render_template, request, current_app, session, redirect, flash, url_for
from db_utils import select_dict
from sql_provider import SQL_Provider
import access


bp_reports = Blueprint('bp_reports', __name__, template_folder='templates', static_folder='static')
provider = SQL_Provider('./sql')

reports = [{'id': 1, 'name': 'Все заказы за месяц и год'}]


@bp_reports.route('/')
@access.auth_required
@access.group_required
def reports_choice():
    return render_template('reports_choice.html', reports=reports)

@bp_reports.route('/create_1', methods=['GET', 'POST'])
def create_1():
    if session['group_name'] == 'admin':
        if request.method == 'GET':
            return render_template('create_1.html')
        else:
            month = request.form.get('month')
            year = request.form.get('year')
            find_check_count = provider.get_sql('check_1.sql', month=month, year=year)
            check_count = select_dict(current_app.config['DB_CONFIG'], find_check_count)
            if check_count[0]['count'] == 0:
                sql = provider.get_sql('create_report_1.sql', month=month, year=year)
                result = select_dict(current_app.config['DB_CONFIG'], sql)
                if result is None:
                    flash(f"Вы создали отчёт за {month} месяц {year} года", 'success')
                    return redirect(url_for('bp_reports.reports_choice'))
                else:
                    flash(f"Нельзя создать отчёт на этот месяц и год", 'error')
                    return render_template('create_1.html')

            else:
                flash('Такой отчёт уже существует', 'error')
                return render_template('create_1.html')
    else:
        flash('У Вас нет доступа', 'error')
        return render_template('reports_choice.html', reports=reports)

@bp_reports.route('/view_1', methods=['GET', 'POST'])
def view_1():
    if request.method == 'GET':
        sql = provider.get_sql('view_reports_1.sql')
        print(sql)
        reports_list = select_dict(current_app.config['DB_CONFIG'], sql)
        print(reports_list)
        return render_template('view_1.html', reports_list=reports_list)
    else:
        month = request.form.get('month')
        year = request.form.get('year')
        sql = provider.get_sql('view_report_result_1.sql', month=month, year=year)
        result = select_dict(current_app.config['DB_CONFIG'], sql)
        title = f"Отчёт за {month} месяц {year} года"
        num = 1
        return render_template('reports_result.html', result=result, title=title, num=num)
