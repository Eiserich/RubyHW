p "Дан целочисленный массив. Найти минимальный положительный элемент."
p array = [16, 4, 56, 3, 65, 55]   
p array.select(&:positive?).min
