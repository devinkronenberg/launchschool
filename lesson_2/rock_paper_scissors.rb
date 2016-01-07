VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_result(choice, computer_choice, score, computer_score)
  prompt "You chose #{choice.upcase}; " \
    "Computer chose #{computer_choice.upcase}"

  if win?(choice, computer_choice)
    prompt "You won! => #{score}:#{computer_score}"
  elsif win?(computer_choice, choice)
    prompt "Computer won! => #{score}:#{computer_score}"
  else
    prompt "It's a tie! => #{score}:#{computer_score}"
  end
end

loop do
  score = 0
  computer_score = 0

  loop do
    choice = ''
    loop do
      prompt "Choose one: #{VALID_CHOICES.join(', ')}"
      str = gets.chomp
      choice = case str.downcase[0, 2]
               when 'r', 'ro'
                 'rock'
               when 'p', 'pa'
                 'paper'
               when 'sc'
                 'scissors'
               when 'l', 'li'
                 'lizard'
               when 'sp'
                 'spock'
               end

      break if VALID_CHOICES.include?(choice)
      prompt "That's not a valid choice."
    end

    computer_choice = VALID_CHOICES.sample

    score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)

    display_result(choice, computer_choice, score, computer_score)

    break if score == 5 || computer_score == 5
  end

  prompt "GAME OVER!"
  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Good bye!"
