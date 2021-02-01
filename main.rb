require "./players"
require "./questions"

# Game setup
puts "Welcome to TwO-O-Player Math Game, this is a 2-player game!"
print "Enter player 1 name: "
name1 = gets.chomp.to_s
print "Enter player 2 name: "
name2 = gets.chomp.to_s

player1 = Players.new(name1)
player2 = Players.new(name2)

count = 0

puts "Welcome #{player1.name} and #{player2.name}, let the game begin.."

# Alternate questions between player1 and player2 until one loses all three lives
while (player1.alive? && player2.alive?) do
  player = (count == 0) ? player1 : player2

  puts '----- NEW TURN -----'

  question = Questions.new

  puts "#{player.name}: #{question.question}"
  print "> "
  answer = gets.chomp

  if answer.to_i == question.answer
    puts "#{player.name}: Yes. You are correct!"
    puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"  
  else 
    player.lives -= 1
    puts "#{player.name} : Seriously? No!"
    puts "#{player1.name} : #{player1.lives}/3 vs #{player2.name}:  #{player2.lives}/3"
  end     
  count = (count + 1) % 2
end

# Game over and announcement of winner and score
if player1.lives == 0
  puts "#{player2.name} wins with a score of #{player2.lives}/3"
  puts '----- GAME OVER -----'
  puts 'Good bye!'
else
  puts "#{player1.name} wins with a score of #{player1.lives}/3"
  puts '----- GAME OVER -----'
  puts 'Good bye!' 
end 
