import time

import src.libs.Adafruit_CharLCD as LCD
import src.controller.ean_search as ean

from src.db import queries as query

lcd = LCD.Adafruit_CharLCDPlate()

# Replace this with your own start/exit code
EXIT_CODE = 4014519196778

def display_off():
    lcd.clear()
    lcd.enable_display(False)
    lcd.set_backlight(0)

def display_on():
    lcd.clear()
    lcd.enable_display(True)
    lcd.set_backlight(1)


def main():
    """
    Program Entry Point
    """
    display_on()
    while True:
        db = query.Database()
        lcd.clear()
        lcd.message("Artikel scannen")
        product_ean = input()
        if product_ean == EXIT_CODE:
            break
        else:
            if not db.find_article(product_ean):
                product_page = ean.do_request(product_ean)
                product_data = ean.cook_soup(product_page)
                if product_data['success']:
                    db.create_article(product_ean, product_data['name'])
                else:
                    lcd.clear()
                    lcd.message("Produkt nicht gefunden")
                    time.sleep(3)
                    break
            db.add_item_to_stock(product_ean)
            product_name = db.get_product_name(product_ean)
            lcd.clear()
            lcd.message(product_name)
            time.sleep(3)

    lcd.clear()
    lcd.message("Einlesen beendet")
    time.sleep(3)
    lcd.clear()
    lcd.message("Gehe schlafen")
    time.sleep(3)
    lcd.clear()
    display_off()

if __name__ == '__main__':
  main()