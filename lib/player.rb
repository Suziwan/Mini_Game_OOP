require 'pry'

class Player
  attr_accessor :name, :life_points
  @@enemies = []

  def initialize(name)
    @name = name
    @life_points = 10
    @@enemies.push(self.name)
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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state
    puts "#{@name} has #{@life_points} life points and a weapon of level #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "You have found a weapon of level #{new_weapon_level}!"
    if new_weapon_level > @weapon_level
      puts "Yay, this weapon is better than yours, take it!"
      @weapon_level = new_weapon_level
    else
      puts "This weapon sucks... don't take it!"
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "You didn't find anything"
    elsif health_pack >= 2 and health_pack <= 5
      puts "Congratulations! You found a pack of +50 life points"
      @life_points += 50
    elsif health_pack == 6
      puts "Wooow, you found a pack of +80 life points!"
      @life_points += 80
    end

    if @life_points > 100
      @life_points = 100
    end
  end
end

#binding.pry
# player1 = Player.new("Suzanne")
# player2 = Player.new("Lisa")
# player3 = HumanPlayer.new("Karine")