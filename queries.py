import pymysql.cursors

def open_connection():
    connection = pymysql.connect(host='INSERT HOST ADDRESS HERE',
                                 user='INSERT DATABASE USER HERE',
                                 password='INSERT DATABASE PASSWORD HERE',
                                 db='INSERT DATABASE NAME HERE',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection

# Checks if a product already exists in the database
def find_article(ean):
    connection = open_connection()
    sql = "SELECT COUNT(*) AS Anzahl FROM `artikel` a WHERE a.ean = %s"
    result = ''
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql, ean)
            result = cursor.fetchone()
    finally:
        connection.close()
        return True if result['Anzahl'] >= 1 else False

# Creates a new article in the database
def create_article(ean, name):
    connection = open_connection()
    sql = "INSERT INTO `artikel` (`ean`, `name`, `kategorie`) VALUES (%s, %s, 5)"
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql, (ean, name))
    finally:
        connection.commit()

    sql = "INSERT INTO `lagerbestand` (`ean`, `bestand`, `aufnahmedatum`) VALUES (%s, %s, CURDATE())"
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql, (ean, 0))
    finally:
        connection.commit()
    connection.close()

# Increases the amount of the product in stock by one
def add_item_to_stock(ean):
    connection = open_connection()
    sql = "UPDATE `lagerbestand` SET `bestand` = `bestand` + 1 WHERE `ean` = %s"
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql, ean)
    finally:
        connection.commit()
        connection.close()

def get_product_name(ean):
    connection = open_connection()
    sql = "SELECT `name` FROM `artikel` a WHERE a.ean = %s"
    result = ''
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql, ean)
            result = cursor.fetchone()
    finally:
        connection.close()
        return result['name']

def get_list():
    connection = open_connection()
    sql = "SELECT l.ean, a.name, k.kategorie, l.bestand, l.aufnahmedatum, DATE_ADD(l.aufnahmedatum,INTERVAL k.ablaufwochen WEEK) AS Ablaufdatum FROM lagerbestand l, artikel a, kategorie k WHERE a.ean = l.ean AND a.kategorie = k.id"
    try:
        with connection.cursor() as cursor:
            cursor.execute(sql)
            result = cursor.fetchone()
            print(result)
    finally:
        connection.close()