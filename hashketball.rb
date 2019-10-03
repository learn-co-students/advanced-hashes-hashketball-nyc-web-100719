def game_hash()
  hash = {
    :home => {  :team_name => "Brooklyn Nets",
                :colors => ["Black", "White"],
                :players => [
                  {:player_name => "Alan Anderson",
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                  },
                  {:player_name => "Reggie Evans",
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                  },
                  {:player_name => "Brook Lopez",
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                  },
                  {:player_name => "Mason Plumlee",
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 11,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                  },
                  {:player_name => "Jason Terry",
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                  },
                  ]},
    :away => {  :team_name => "Charlotte Hornets",
                :colors => ["Turquoise", "Purple"],
                :players => [
                  {:player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                  },
                  {:player_name => "Bismack Biyombo",
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 22,
                    :blocks => 15,
                    :slam_dunks => 10
                  },
                  {:player_name => "DeSagna Diop",
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                  },
                  {:player_name => "Ben Gordon",
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                  },
                  {:player_name => "Kemba Walker",
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 7,
                    :blocks => 5,
                    :slam_dunks => 12
                  },
                  ]
        }
  }
  hash
end

require 'pry'
def num_points_scored(name)
  game_hash.each { |key, value|
    value.each {|subkey, subvalue|
    if subkey == :players
      subvalue.each do |player|
        if player[:player_name] == name
          return player[:points]
        end
      end
    end
    }
  }
end

def shoe_size(name)
  game_hash.each { |key, value|
    value.each {|subkey, subvalue|
    if subkey == :players
      subvalue.each do |player|
        if player[:player_name] == name
          return player[:shoe]
        end
      end
    end
    }
  }
end

def team_colors(name)
  game_hash.each { |key, value|
    if value[:team_name] == name
       return value[:colors]
    end
    }
end

def team_names
  game_hash.map { |key, value|
    value[:team_name]
  }
end


def player_numbers(team_name)
  numbers = []
  game_hash.map { |key, value|
    if value[:team_name] == team_name
      value.each { |subkey, subvalue|
        if subkey == :players
          subvalue.map { |player|
          numbers << player[:number]
          }
        end
      }
    end
  }
  return numbers
end


def player_stats(name)
  stats = {}
  game_hash.each { |key, value|
    value.each {|subkey, subvalue|
    if subkey == :players
      subvalue.each do |player|
        if player[:player_name] == name
          stats = player.delete_if {|k, v|
            k == :player_name
          }
        end
      end
    end
    }
  }
  stats
end

def big_shoe_rebounds()
  biggest_shoe = 0
  
  game_hash.each { |key, value|
    value.each {|subkey, subvalue|
    if subkey == :players
      subvalue.each do |player|
        if player[:shoe] > biggest_shoe
          biggest_shoe = player[:shoe]
        end
      end
      subvalue.each do |shoe|
        if shoe[:shoe] == biggest_shoe
          return shoe[:rebounds]
        end
      end
    end
    }
  }
end

def most_points_scored()
  high_scorer = 0
  mvp = ""
  game_hash.each {|key, value|
    value.each {|subkey, subvalue|
    if subkey == :players
      subvalue.each do |player|
        if player[:points] > high_scorer
          high_scorer = player[:points]
          mvp = player[:player_name]
        end
      end
    end
    }
  }
  return mvp
end

def winning_team()
nets = 0 
hornets = 0

  game_hash.each {|key, value|
    if key == :home
      value.each {|subkey, subvalue|
        if subkey == :players
          subvalue.each { |player|
            nets += player[:points]  
          }
        end
      }
    elsif key == :away
      value.each {|subkey, subvalue|
        if subkey == :players
          subvalue.each { |player|
            hornets += player[:points]  
          }
        end
      }
    end
  }
  if nets > hornets
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end


def player_with_longest_name()
player_name = ""
  game_hash.each {|key, value|
      value.each {|subkey, subvalue|
        if subkey == :players
          subvalue.each { |player|
            if player_name.length < player[:player_name].length
              player_name = player[:player_name]
            end
          }
        end
      }
  }  
  return player_name
end

def long_name_steals_a_ton?()
player_name = ""

  game_hash.each {|key, value|
      value.each {|subkey, subvalue|
        if subkey == :players
          subvalue.each { |player|
            if player_name.length < player[:player_name].length
              player_name = player[:player_name]
            end
          }
        end
      }
  }  

most_steals = ""
steals = 0
  game_hash.each {|key, value|
    value.each {|subkey, subvalue|
    if subkey == :players
      subvalue.each do |player|
        if player[:steals] > steals
          steals = player[:steals]
          most_steals = player[:player_name]
        end
      end
    end
    }
  }

if most_steals = player_name
  return true 
else 
  return false 
end


end





