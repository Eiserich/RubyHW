p "Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент."
p array = [16, 4, 56, 3, 65, 55]   
p array.map { |e| e.negative? ? [array.first , e] : e }.flatten
