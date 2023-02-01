require 'pry'
require_relative 'lib/game'
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
  # call method show_players
  # call method menu
  # call method menu_choice
  # call method enemies_attack

  if player1.life_points <= 0 || player2.life_points <= 0
    break
  elsif user.life_points <= 0
    break
  end
  puts "------------------- Next round ------------------\n"
end

# call method "end"
