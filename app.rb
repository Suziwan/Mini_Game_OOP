require 'pry'
#require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Suzanne")
player2 = Player.new("Lisa")

while player1.life_points > 0 && player2.life_points > 0
  puts "Here are our players' status :"
  player1.show_state
  puts player2.show_state

  puts "Let's launch the attack phase :"
  player1.attacks(player2)
  if player1.life_points <= 0 || player2.life_points <= 0
    break
  end
  player2.attacks(player1)
  puts "\n-------------Next-round-------------\n"
end
