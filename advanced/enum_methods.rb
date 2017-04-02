module Enumerable

  def my_each
    array = self.to_a
    for n in 0..array.length
      yield(array[n])
    end
  end

  def my_each_with_index
  	array = self
  	for n in 0...array.length
  	  yield(array[n], n)
  	end
  end

  def my_select
    array = self
    for n in 0..array.length
      yield(array[n])
    end
  end

end

#TESTS=====================================================================

#my_each test
array = ["hello",2,"goodbye",4]
array.my_each do |i|
  puts i
end

#my_each_with_index test
index_array = ["hello", "my", "name", "is"]
index_array.my_each_with_index do |i, v|
  print v
  puts i
end

#my_select test (works but returns error. Don't really understand this method tbh)
select_array = [1,2,3,4,5]

select_array.my_select do |i|
  puts i + 2
end