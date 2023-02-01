require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|              Welcome to the game              |"
puts "|          Try to be the last survivor !        |"
puts "-------------------------------------------------"

puts "-------------- What is your name ? --------------"
print "> "
user = gets.chomp

my_game = Game.new(user)

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  my_game.show_players # call method show_players
  my_game.menu # call method menu
  my_game.menu_choice # call method menu_choice
  my_game.enemies_attack # call method enemies_attack

  if player1.life_points <= 0 || player2.life_points <= 0
    break
  elsif user.life_points <= 0
    break
  end
  puts "------------------- Next round ------------------\n"
end

my_game.end # call method "end"
