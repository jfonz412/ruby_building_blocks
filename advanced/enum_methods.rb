module Enumerable


=begin
pass each array index value into the block
=end

  def my_each
    array = self.to_a
    for n in 0...array.length
      yield(array[n])
    end
  end

=begin
pass both the index AND the value into the block
=end

  def my_each_with_index
  	array = self
  	for n in 0...array.length
  	  yield(array[n], n)
  	end
  end
  
=begin
if the item passes the block's requirements it is passed into a new array
=end

  def my_select
    array = self
    new_array = []
    for n in 0...array.length
      if yield(array[n]) == true
        new_array << array[n]
      end
    end
    new_array
  end

=begin
checks entire array to make sure all values return true according to the block
=end

  def my_all?
  	array = self
  	for n in 0...array.length
  	  if yield(array[n]) == false
  	    return false
  	  end
  	end
  	return true
  end

=begin
checks if ANY values return true according to the block
=end

  def my_any?
    array = self
    for n in 0...array.length
      if yield(array[n]) == true
        return true
      end
    end
    return false
  end

=begin
returns true if all values DO NOT return true according to the block
=end

  def my_none?
  	array = self
  	for n in 0...array.length
  	  if yield(array[n]) == true
  	   return false
  	  end
  	end
  	return true
  end

=begin
counts how many instances of true when each value is matched against the block
=end

  def my_count
  	counter = 0
  	array = self
  	  for n in 0...array.length
  	  	if yield(array[n]) == true
  	      counter += 1
  	    end
  	  end
  	counter
  end

=begin
does some stuff with each value then passes it to a new array
=end

  def my_map(procc = nil)
  	new_array = []
    array = self
  	if procc == nil
      for n in 0...array.length
  	    new_array << yield(array[n])
      end
      new_array

    else
      array.my_each {|n| new_array << procc.call(n)}
    end
    new_array
  end

=begin
sums or multiplies each value of the array against eachother. 
If you want to multiply, you must pass the array in as an argument as well
in order to get to the first index of the array
=end

  def my_inject(mul_array=nil)
  	array = self
  	if mul_array != nil
  	  total = array.first
  	  n = 1
    else
      total = 0
      n = 0
    end

    for n in 0...array.length
      total = yield(total, array[n])
    end
    total
  end


end

#TESTS=====================================================================

#my_each test
array = ["hello",2,"goodbye",4]
array.my_each do |i|
  puts i
end

puts "\n"

#my_each_with_index test
index_array = ["hello", "my", "name", "is"]
index_array.my_each_with_index do |i, v|
  print v
  puts i
end

puts "\n"

#my_select test
select_array = [1,2,3,4,5]
selected_array = select_array.my_select {|num| num.odd?}
puts selected_array

puts "\n"

#my_all? test
all_array = ["he", "bye", "tacos"]
puts all_array.my_all? {|word| word.length == 2}

puts "\n"

#my_any? test
any_array = ["he", "bye", "I"]
puts any_array.my_any? {|word| word.length >= 3}

puts "\n"

#my_none? test
none_array = ["Jimmy", "Shannon", "Michael", "Buddy"]
puts none_array.my_none? {|n| n = "Sarah"} #should return true because "Sarah" is not in the array

puts "\n"

#my_count test
count_array = [1,2,3,4,5]
puts count_array.my_count {|x| x % 2 == 0} #should return '2' for 2 even numbers

puts "\n"

#my_map test
map_array = [0, 1, 2, 3]
puts map_array.my_map {|x| x*2}
puts "\n"

#my_inject test
inject_array = [5,6,7,8,9,10]
puts inject_array.my_inject {|sum, n| sum + n}
puts "\n"

#test2, takes the array as an argument to extract first index
puts inject_array.my_inject(inject_array) {|product, n| product * n}
puts "\n"

#my_map test
map_array = [0, 1, 2, 3]
double = Proc.new{|x| x*2}
puts map_array.my_map(double)
puts "\n"