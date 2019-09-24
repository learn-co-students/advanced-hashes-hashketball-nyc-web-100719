require "pry"



def game_hash
    hash = {}
    hash[:home] = {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], 
    :players => ["Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1},
        ]}

    hash[:away] = {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], 
    :players => ["Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Kemba Walker" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12},
        ]}
    return hash
  end
  
  def good_practices
  game_hash.each do |location, team_data|
     binding.pry
    team_data.each do |attribute, data|
       binding.pry
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(player_name)
    game_hash.each do |key, value|
      value[:players][0].each do |key1, value1|
        if key1 == player_name
         return value[:players][0][player_name][:points]
        end
      end
    end
end

def shoe_size(player_name)
    game_hash.each do |key, value|
      value[:players][0].each do |key1, value1|
        if key1 == player_name
         return value[:players][0][player_name][:shoe]
        end
      end
    end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    if value[:team_name] == team_name 
      return value[:colors]
    end
  end
end

def team_names
  array = []
  game_hash.each do |key, value|
    array << value[:team_name]
  end
  return array
end

def player_numbers(team_name)
  array = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name 
      value[:players][0].each do |key1, value1|
      array << value1[:number]
      end
    end
  end
  return array
end

def big_shoe_rebounds
  shoe_size = 0 
  rebound_of_largest_shoe = 0
  game_hash.each do |key, value|
      value[:players][0].each do |key1, value1|
      if value1[:shoe] > shoe_size
        shoe_size = value1[:shoe]
        rebound_of_largest_shoe = value1[:rebounds]
        end
      end
    end
  return rebound_of_largest_shoe
end

def player_stats(player_name)
  game_hash.each do |key, value|
    value[:players][0].each do |key1, value1|
      if key1 == player_name
       return value[:players][0][player_name]
      end
    end
  end
end

def most_points_scored
  most_points = 0
  best_player = ""
game_hash.each do |key, value|
  value[:players][0].each do |key1, value1|
    if num_points_scored(key1) > most_points
      best_player = key1
      most_points = num_points_scored(key1) 
      end
    end
  end
  return best_player
end

def winning_team
  points_b_n = 0 
  points_c_h = 0 
  
  game_hash.each do |key, value|
    if value[:team_name] == team_names[0]
      value[:players][0].each do |key1, value1|
      points_b_n += value1[:points]
      end
    else if value[:team_name] == team_names[1]
      value[:players][0].each do |key1, value1|
      points_c_h += value1[:points]
        end
      end
    end
  end
  if points_c_h > points_b_n
    return team_names[1]
  else return team_names[0]
  end
end

def player_with_longest_name
  player_name = ""
  longest_length = 0
  game_hash.each do |key, value|
      value[:players][0].each do |key1, value1|
        if key1.length > longest_length
          longest_length = key1.length
          player_name = key1
          end
        end
    end
    return player_name
end

def long_name_steals_a_ton?
  most_steals = 0
    game_hash.each do |key, value|
      value[:players][0].each do |key1, value1|
        if key1 == player_with_longest_name
          most_steals = value[:players][0][player_with_longest_name][:steals]
            if value1[:steals] > most_steals
              return false
            end
          end
        end
      end
   return true
end
