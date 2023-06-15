def post(family_per, name_per, country_per, city_per, street_per, home_num_per, apartment_num_per):
    print()
    print('фамилия: ', family_per)
    print('имя: ', name_per)
    print('страна: ', country_per)
    print('город: ', city_per)
    print('улица: ', street_per)
    print('дом: ', home_num_per)
    print('квартира: ', apartment_num_per)

for i in range(3): 
    print()
    family = input('фамилия: ')
    name = input('имя: ')
    country = input('страна: ')
    city = input('город: ')
    street = input('улица: ')
    home_num = input('дом: ')
    apartment_num = input('квартира: ')
    
    post(family, name, country, city, street, home_num, apartment_num)

