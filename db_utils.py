﻿from db_connect import DB_Context_Manager

def select_dict(config: dict, _sql: str):
    with DB_Context_Manager(config) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')
        else:
            cursor.execute(_sql)
            result = cursor.fetchall()
            if result:
                schema = [item[0] for item in cursor.description]  # description is a set, here are names etc
                result_dict = [dict(zip(schema, product)) for product in result]
                return result_dict
            else:
                return None


def insert_sql(config: dict, _sql: str):
    with DB_Context_Manager(config) as cursor:
        if cursor is None:
            raise ValueError("Курсор не создан")

        cursor.execute(_sql)
        return cursor.rowcount
