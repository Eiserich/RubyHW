p "Дан целочисленный массив. Найти минимальный четный элемент."
p array = [16, 4, 56, 3, 65, 55]   
p array.find_all(&:even?).min
