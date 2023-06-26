price_in_euro = float(input('Стоимость товара в Евро: '))

price_in_dollar = price_in_euro * 1.25
price_in_rub = price_in_dollar * 60.87


print(price_in_dollar, 'доллара')
print(price_in_rub, 'рублей')