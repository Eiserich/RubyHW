p "Дан целочисленный массив. Найти максимальный отрицательный элемент."
p array = [16, 4, 56, 3, 65, 55]   
p array.select(&:negative?).max
