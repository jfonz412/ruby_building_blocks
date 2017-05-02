#---Seperate methods file for cleaner looking code
require "./lib/methods.rb"

encryption = nil

#---Get string from user
loop do 
  puts "Please enter a word or a phrase:\n"
  text = gets.chomp
  puts "Now please enter a key to encrypt your message:\n"
  key = gets.chomp

  encryption = encrypted_text = caesar_cipher(text,key)
  break if encryption != false
end

puts "Your encrypted phrase is \"#{encryption}\""