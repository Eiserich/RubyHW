p "Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять."
p array = [16, 4, 56, 3, 65, 55]
p array.map { |e| e.odd? && (e != array[0] && e != array[-1]) ? e + array[0] : e }
