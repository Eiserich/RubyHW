p "Дан целочисленный массив. Найти количество минимальных элементов."
p array = [16, 4, 56, 3, 65, 55]   
p array.count{ |e| e==array.min}
