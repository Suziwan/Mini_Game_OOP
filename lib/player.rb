require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} has #{@life_points} life points"
  end

  def gets_damage(damage_points)
    @life_points -= damage_points
    if @life_points <= 0
      puts "#{@name} has been killed!"
    end
  end

  def attacks(new_player)
    puts "#{@name} attacks #{new_player.name}"
    damage = compute_damage
    puts "#{@name} is inflicting #{damage} damage points"
    new_player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end
