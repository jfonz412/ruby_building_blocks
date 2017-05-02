def check_text(text)

  if text.empty?
    puts "You didn't enter anything...try again"
    puts
    return false
  end

  invalid_count = 0
  text.scan(/\W/) {|i| invalid_count += 1}
  text.scan(/\d/) {|i| invalid_count += 1}

  if invalid_count > 0
    puts "Do not include numbers or punctuation in your phrase"
    false
  else
    true
  end
  
end


def check_key(key)

  invalid_count = 0
  key.scan(/[^\d]/) {|i| invalid_count += 1}

  if invalid_count > 0
    puts "Please do not include letters or punctuation in your phrase."
    false
  else
    true
  end

end


def caesar_cipher(text,key)

  return false if check_text(text) == false
  return false if check_key(key) == false

  text = text.downcase
  new_string = []
  
  text.scan(/./) do |i|
      i = i.ord + key.to_i

      i = (i % 122) + 96 if i > 122 #cycles back to begining of alphabet

      new_string << i.chr
  end

  new_string.join('')
end
