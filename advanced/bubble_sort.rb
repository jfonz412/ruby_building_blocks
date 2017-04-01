def bubble_sort(array)
  temp = 0
  swapped = false

  for num in 0..array.length
  	if array[num + 1] != nil
      if array[num] > array[num + 1]  
        temp = array[num]
        array[num] = array[num+1]
        array[num+1] = temp
        swapped = true
      end
    end	
  end

  swapped ? bubble_sort(array) : array

end


def bubble_sort_by(array)
  temp = 0
  swapped = false

  for num in 0..array.length
    if array[num + 1] != nil
  	  if yield(array[num], array[num+1]) > 0
  	    temp = array[num]
        array[num] = array[num+1]
        array[num+1] = temp
        swapped = true
  	  end
    end
  end

  swapped ? bubble_sort_by(array) {|left,right| left.length - right.length} : array

end

#==================================================================

#testing bubble_sort
test_array = [3,2,5,1,6,7,9,8,4]

puts bubble_sort(test_array)
puts "NEXT"

#testing bubble_sort_by
test_array2 = ["hi","hello","hey"]

answer = bubble_sort_by(test_array2) do |left, right|
  left.length - right.length
end

puts answer