def substrings(input, dictionary)
  #create empty hash, default value of 0
  output = Hash.new(0)

  #split up input into substrings, remove case sensativity
  substrings = input.downcase.split()
  puts substrings


  #compare each substring to each dictionary word
  #strip punctuation before comparing
  # track matches by dictionary word with output hash

  substrings.each do |substring|
    dictionary.each do |word|
  	  if substring.gsub(/[[:punct:]]/, '').include?(word)
  	    output[word] +=1
  	  end
    end
  end
  puts output
end
#============================================================================

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?" , dictionary)