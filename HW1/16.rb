p "Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент."
p array = [16, 4, 56, 3, 65, 55]   
p array.map { |e| e.negative? ? [e, array.first] : e }.flatten