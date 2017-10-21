import requests
from bs4 import BeautifulSoup

def do_request(ean):
    """
    Performs a request with the given EAN and returns it
    :param ean: The EAN from the input stream
    :return: The request response
    """
    url = 'INSERT URL OF EAN DATABASE HERE'
    r = requests.get(url)
    return r


def cook_soup(response):
    """
    Initializes a BeautifulSoup Object on the response text and uses it to extract the product name
    :param response: The response text from the request
    :return:
    """
    soup = BeautifulSoup(response.text, 'html.parser')
    data = soup.h1.text
    data = data.replace('\n', '').replace('\t', '')
    if "Es wurde kein Produkt" in data:
        result = {'success' : False}
    elif "Suchresultate" in data:
        result = {'success' : False}
    else:
        result = {'success' : True, 'name' : data}
    return result
