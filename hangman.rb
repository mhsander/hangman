# hangman game based on list of hard coded words. Martha Sander, 10/2018
# list of words stored in array word_list
word_list = %w"Portland Oregon Garfield Travel Pineapple Coconut Books Puppies Nova"

#variables for guessed letters and number of tries
correct_guesses = []
wrong_guesses = []
tries_left = 6

#Welcome message
puts "*******************"
puts "Let's play Hangman!"
puts "*******************"
puts

#select random word from list
word = word_list[rand(word_list.length) - 1].upcase

#convert word into array of chars, store number of unique letters to win_count
word_array = word.chars
win_count = word_array.uniq.length

#display placeholder for word
word.length.times do
  print "_ "
end
puts

#6 stages of hangman for wrong guesses
hang1 =
"************
 |
 0"

hang2 =
"************
 |
 0
 |"

hang3 =
"************
 |
 0
/|"

hang4 =
"************
 |
 0
/|\\
"

hang5 =
"************
 |
 0
/|\\
/"

hang6=
"************
 |
 0
/|\\
/ \\
"


#run the game in a while loop
while tries_left > 0 and win_count > 0
  #display game score
  puts "Number of lives left: #{tries_left}"
  puts "Wrong guesses: #{wrong_guesses}"
  puts "Correct guesses: #{correct_guesses}"
  puts

  #get user input
  print "Enter your guess: "
  current_guess = gets.chomp.upcase

  #check if letter is repeated
  while correct_guesses.include?(current_guess) || wrong_guesses.include?(current_guess)
    print "You already guessed this letter. Enter a different guess: "
    current_guess = gets.chomp.upcase
  end
  puts

  #add to corect_guesses or wrong_guesses, modify win_count if correct and tries_left if incorrect
  if word_array.uniq.include?(current_guess)
    correct_guesses.push(current_guess)
    win_count -= 1
  else
    wrong_guesses.push(current_guess)
    tries_left -= 1
  end

  #display correct guesses or placeholders for missing letters
  for char in word_array do
    if correct_guesses.include?(char)
      print char + " "
    else
      print "_ "
    end
  end
  puts

  #display hangman
  case tries_left
  when 5
    puts hang1
  when 4
    puts hang2
  when 3
    puts hang3
  when 2
    puts hang4
  when 1
    puts hang5
  when 0
    puts hang6
  end
  puts
  puts

end
#game over when tries left == 0
puts "*****************"
if tries_left == 0
  puts "GAME OVER"
  puts "The word was #{word}"
else
  puts "Congrats! You won the game!"
  puts "You guessed #{word}!"
end