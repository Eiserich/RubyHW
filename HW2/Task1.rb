array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]

puts 'дізнатись кількість елементів в масиві'
puts array.size

puts 'перевернути масив'
puts array.reverse

puts 'знайти найбільше число'
puts array.max

puts 'знайти найменше число'
puts array.min

puts 'відсортувати від меншого до більшого'
puts array.sort

puts 'відсортувати від більшого до меншого'
puts array.sort.reverse

puts 'видалити всі непарні числа'
puts array.delete_if(&:odd?)

puts 'залишити тільки ті числа, які без остачі ділятся на 3'
puts array.find_all{ |elem| elem % 3 == 0 }

puts 'видалити з масиву числа, які повторюються'
puts array.uniq

puts 'розділити кожен елемент на 10, в результаті елементи не мають бути округленими до цілого'
puts array.map{ |elem| elem.to_f/10 }

puts 'отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві'
array1 = array.select { |el| el <= 26 && el >= 1 }
array2 = ('A'..'Z').to_a
puts array1.map { |i| array2[i - 1] }

puts 'змінити місцями мінімальний і максимальний елементи масиву'
array_temp = array.clone
min_el = array_temp.each_with_index.min[1]
max_el = array_temp.each_with_index.max[1]
array_temp[min_el], array_temp[max_el] = array_temp[max_el], array_temp[min_el]
puts array_temp

puts 'знайти елементи, які знаходяться перед мінімальним числом в масиві'
puts array[0...array.index(array.min)]

puts 'необхідно знайти три найменших елементи'
puts array.min(3)
