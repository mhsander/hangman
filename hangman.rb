# hangman game based on list of hard coded words.
# list of words in an array
word_list = %w"Portland Oregon Garfield Travel Pineapple Coconut Books Puppies"
#variables for guessed letters and number of tries
correct_guesses = []
wrong_guesses = []
tries_left = 6

#begin game
puts "Let's play hangman!"
puts "*******************"
puts

#select word from list
word = word_list[rand(word_list.length) - 1].upcase
#convert word into array of chars
word_array = word.chars
win_count = word_array.uniq.length

#puts placeholder for word
word.length.times do
  print "_ "
end
puts

#run the game while loop
while tries_left > 0 and win_count > 0
  #display game score
  puts "Number of lifes left: #{tries_left}"
  puts "Wrong guesses: #{wrong_guesses}"
  puts "Correct guesses: #{correct_guesses}"
  puts

  #get user input
  puts "Enter your guess:"
  puts word + " will delete"
  current_guess = gets.chomp.upcase

  #check if letter is repeated
  while correct_guesses.include?(current_guess)
    puts "You already guessed this letter. Enter a different guess:"
    current_guess = gets.chomp.upcase
  end
  puts

  #add to corect_guesses or wrong_guesses, modify win_count if correct
  if word_array.uniq.include?(current_guess)
    correct_guesses.push(current_guess)
    win_count -= 1
  else
    wrong_guesses.push(current_guess)
    tries_left -= 1
  end

  #display correct guesses + or placeholders
  for char in word_array do
    if correct_guesses.include?(char)
      print char + " "
    else
      print "_ "
    end
  end
  puts

end
#game over = no tries left
puts "*****************"
if tries_left == 0
  puts "GAME OVER"
else
  puts "Congrats! You won the game!"
end