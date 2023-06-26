
def count_numbers(first_n):
    first_num_count = 0
    temp = first_n
    while temp > 0:
        first_num_count += 1
        temp = temp // 10
    return first_num_count
 

def change_number(first_n):
    first_num_count = 0
    temp = first_n
    while temp > 0:
        first_num_count += 1
        temp = temp // 10
    if first_num_count < 3:
        print(end='')
    else:
        last_digit = first_n % 10
        first_digit = first_n // 10 ** (first_num_count - 1)
        between_digits = first_n % 10 ** (first_num_count - 1) // 10
        first_n = last_digit * 10 ** (first_num_count - 1) + between_digits * 10 + first_digit
    return first_n


def main():
    first_n = int(input("Введите первое число: "))
    second_n = int(input("Введите второе число: "))
    if first_n < 3:
        print("В первом числе меньше трёх цифр.")
    else:
        first_count = count_numbers(first_n)
        print("В первом числе", first_count)
        print('Изменённое первое число:', change_number(first_n))
    if second_n < 4:
        print("Во втором числе меньше четырёх цифр.")
    else:
        second_count = count_numbers(second_n)
        print("В втором числе", second_count)
        print('Изменённое второе число:', change_number(second_n))

main()