require 'pry'
#require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|              Welcome to the game              |"
puts "|          Try to be the last survivor !        |"
puts "-------------------------------------------------"

puts "-------------- What is your name ? --------------"
print "> "
user = HumanPlayer.new(gets.chomp)
player1 = Player.new("Karine")
player2 = Player.new("Lisa")
enemies = [player1, player2] # Try to find a way to do it with @@enemies in the Player class

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "Here is the current situation :"
  print user.show_state
  print player1.show_state
  print player2.show_state
  print "> Press enter to continue" 
  puts(gets.chomp)

  puts "------------ What do you want to do ? -----------"
  puts "a : Look for a better weapon"
  puts "b : Try to find a health pack"
  print "0 : Attack #{player1.name} - " 
  print player1.show_state
  print "1 : Attack #{player2.name} - " 
  print player2.show_state
  print "> "
  choice = gets.chomp

  if choice == "a" # Search weapon
    user.search_weapon
  elsif choice == "b" # Search health pack
    user.search_health_pack
  elsif choice == "0" # Attack player1
    user.attacks(player1)
  elsif choice == "1" # Attack player2
    user.attacks(player2)
  else
    puts "Wrong answer : choose between the 4 actions (a, b, 0 and 1)"
  end
  print "> Press enter to continue" 
  puts(gets.chomp)

  puts "------- Other players are attacking you! --------\n"
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end
  print "> Press enter to continue" 
  puts(gets.chomp)

  if player1.life_points <= 0 || player2.life_points <= 0
    break
  elsif user.life_points <= 0
    break
  end

  puts "------------------- Next round ------------------\n"
end

puts "============= The game is finished =============="
if player1.life_points <= 0 || player2.life_points <= 0
  puts "~~~~~~~~~ Congratulations! You won! :D ~~~~~~~~~~"
elsif user.life_points <= 0
  puts "____________ Sorry... You lost! :'( _____________"
end
