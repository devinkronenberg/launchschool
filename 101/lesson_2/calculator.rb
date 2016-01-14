LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
  # /^\d+$/.match(input)
  # Integer(input) rescue false
end

def float?(input)
  # input.to_f.to_s == input
  # /\d/.match(input) && /^\d*\.?\d*$/.match(input)
  Float(input) rescue false
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(operation)
  word = case operation
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

prompt 'welcome'
prompt 'enter_name'

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt 'valid_name'
  else
    break
  end
end

puts "Hi #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt 'ask_first_num'
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt 'invalid_num'
    end
  end

  number2 = ''
  loop do
    prompt 'ask_second_num'
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt 'invalid_num'
    end
  end

  prompt 'ask_operation'

  operation = ''
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt 'invalid_operation'
    end
  end

  puts "#{operation_to_message(operation)} the two numbers..."

  result = case operation
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  puts "The result is #{result}"

  prompt 'ask_another'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'good_bye'
