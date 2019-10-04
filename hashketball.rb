require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
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
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
        ]
      }, 
    :away => {
      :team_name => "Charlotte Hornets", 
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
        :slam_dunks => 2},
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}
        ]
      }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry

      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    x = 0
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        #binding.pry
        if value == player_name
          return team_data[:players][x][:points]
        end
      end
      x += 1
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    x = 0
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        #binding.pry
        if value == player_name
          return team_data[:players][x][:shoe]
        end
      end
      x += 1
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_color_array = team_data[:colors]
      return team_color_array
    end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_name_array << team_data[:team_name]
  end
  return team_name_array
end

def player_numbers(team_name)
  player_numbers_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      x = 0
      team_data[:players].each do |attribute|
        attribute.each do |key, value|
          #binding.pry
          player_numbers_array << team_data[:players][x][:number]
        end
        x += 1
      end
    end
  end
  return player_numbers_array.uniq!
end

def player_stats(player_name)
  player_stats_hash = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |attributes|
      if attributes[:player_name] == player_name
        player_stats_hash = attributes
      end
    end
  end
  player_stats_hash.delete(:player_name)
  player_stats_hash
end

def big_shoe_rebounds
  player_shoe_hash = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        player_shoe_hash[attribute[:player_name]] = attribute[:shoe]
      end
    end
  end
  sorted_shoe_hash = player_shoe_hash.sort_by {|k, v| -v}
  biggest_shoe_player_name = sorted_shoe_hash[0][0]
  #binding.pry
    game_hash.each do |location, team_data|
    x = 0
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        #binding.pry
        if value == biggest_shoe_player_name
          return team_data[:players][x][:rebounds]
        end
      end
      x += 1
    end
  end
end

def most_points_scored
  player_points_hash = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        player_points_hash[attribute[:player_name]] = attribute[:points]
      end
    end
  end
  sorted_points_hash = player_points_hash.sort_by {|k, v| -v}
  most_points_player_name = sorted_points_hash[0][0]
  return most_points_player_name
end

def winning_team
  home_points = 0
  away_points = 0
  points_array = []
  game_hash.each do |location, team_data|
    x = 0
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        #binding.pry
        if key == :slam_dunks
          points_array << team_data[:players][x][:points]
        end
      end
      x += 1
    end
  end
  home_points = points_array.slice(0,5).sum
  away_points = points_array.slice(5,5).sum
  #binding.pry
  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif away_points > home_points
    return game_hash[:away][:team_name]
  else
    return "TIE GAME"
  end
end

def player_with_longest_name
  name_array = []
  game_hash.each do |location, team_data|
    x = 0
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        #binding.pry
        if key == :slam_dunks
          name_array << team_data[:players][x][:player_name]
        end
      end
      x += 1
    end
  end
  sorted_name_array = name_array.sort_by { |x| -x.length }
  return sorted_name_array[0]
end

def long_name_steals_a_ton?
  player_steals_hash = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute|
      attribute.each do |key, value|
        player_steals_hash[attribute[:player_name]] = attribute[:steals]
      end
    end
  end
  sorted_steals_hash = player_steals_hash.sort_by {|k, v| -v}
  most_steals_player_name = sorted_steals_hash[0][0]
  if most_steals_player_name == player_with_longest_name
    return true
  else return false
  end
end

#puts num_points_scored("Reggie Evans")
#good_practices
player_with_longest_name