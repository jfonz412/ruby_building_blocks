#Iterate through this array and pick out the biggest and smallest prices
def stock_picker(days)
  high = 0
  low = 1000 #arbitrary value, just needs to be high

  #check all values against eachother, file into appropriate variable
  days.each do |i|
    high = i if i > high
    low = i if i < low
  end

  #get the index number and put it into another array
  buy = days.index(low)
  sell = days.index(high)
  buy_sell = [buy, sell]
end

#--------------------------------------------------------------
days = [16,2,4,7,11,9,12]

buy_sell = stock_picker(days)
puts buy_sell