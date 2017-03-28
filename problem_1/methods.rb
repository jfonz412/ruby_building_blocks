#DEFINITIONS------------------------------------------------------

#Prompt the user for a phrase
def get_text
  puts "Please enter a word or a phrase:"
  puts "\n"
  text = gets.chomp
  puts "\n"
  
  #scan the tesxt for invalid chars
  invalid_count = 0
  text.scan(/[^A-Z][^a-z]/) {|i| invalid_count += 1}
  
  #if invalid chars found, send user back, else return the string
  if invalid_count > 0
    puts "Please do not include numbers or punctuation in your phrase."
    text = get_text
  else
    text
  end
end


def get_key
  puts "Now please enter a key to encrypt your message:"
  puts "\n"
  key = gets.chomp
  puts "\n"

  #scan the tesxt for invalid chars
  invalid_count = 0
  key.scan(/[^\d]/) {|i| invalid_count += 1}

  #if invalid chars found, send user back, else return the key
  if invalid_count > 0
    puts "Please do not include letters or punctuation in your phrase."
    key = get_key
  else
    key
  end
end

#-----------------------------------------------------------------