class game
  attr_accessor :human_player, :enemies
  game_on = true

  def initialize()
  end

  def kill_player
  end

  def is_still_ongoing?
  end

  def show_players
    puts "Here is the current situation :"
    print user.show_state
    print player1.show_state
    print player2.show_state
    print "> Press enter to continue" 
    puts(gets.chomp)
  end

  def menu
    puts "------------ What do you want to do ? -----------"
      puts "a : Look for a better weapon"
      puts "b : Try to find a health pack"
      print "0 : Attack #{player1.name} - " 
      print player1.show_state
      print "1 : Attack #{player2.name} - " 
      print player2.show_state
      print "> "
      choice = gets.chomp
  end

  def menu_choice
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
  end

  def enemies_attack
    puts "------- Other players are attacking you! --------\n"
    enemies.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(user)
      end
    end
    print "> Press enter to continue" 
    puts(gets.chomp)
  end

  def end
    puts "============= The game is finished =============="
    if player1.life_points <= 0 || player2.life_points <= 0
      puts "~~~~~~~~~ Congratulations! You won! :D ~~~~~~~~~~"
    elsif user.life_points <= 0
      puts "____________ Sorry... You lost! :'( _____________"
    end
  end
end
