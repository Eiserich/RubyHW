p "Дан целочисленный массив. Найти минимальный нечетный элемент."
p array = [16, 4, 56, 3, 65, 55]   
p array.find_all(&:odd?).min
