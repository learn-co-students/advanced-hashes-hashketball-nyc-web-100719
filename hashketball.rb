require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0, 
        :shoe => 16, 
        :points => 22, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 1
      },
      {
        :player_name => "Reggie Evans",
        :number => 30, 
        :shoe => 14, 
        :points => 12, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 12, 
        :blocks => 12, 
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11, 
        :shoe => 17, 
        :points => 17, 
        :rebounds => 19, 
        :assists => 10, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1, 
        :shoe => 19, 
        :points => 26, 
        :rebounds => 11, 
        :assists => 6, 
        :steals => 3, 
        :blocks => 8, 
        :slam_dunks => 5 
      },
      {
        :player_name => "Jason Terry",
        :number => 31, 
        :shoe => 15, 
        :points => 19, 
        :rebounds => 2, 
        :assists => 2, 
        :steals => 4, 
        :blocks => 11, 
        :slam_dunks => 1
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4, 
        :shoe => 18, 
        :points => 10, 
        :rebounds => 1, 
        :assists => 1, 
        :steals => 2, 
        :blocks => 7, 
        :slam_dunks => 2
      },
      { 
        :player_name => "Bismack Biyombo",
        :number => 0, 
        :shoe => 16, 
        :points => 12, 
        :rebounds => 4, 
        :assists => 7, 
        :steals => 22, 
        :blocks => 15, 
        :slam_dunks => 10 
      }, 
      { 
        :player_name => "DeSagna Diop",
        :number => 2, 
        :shoe => 14, 
        :points => 24, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 4, 
        :blocks => 5, 
        :slam_dunks => 5
      },
      { 
        :player_name => "Ben Gordon",
        :number => 8, 
        :shoe => 15, 
        :points => 33, 
        :rebounds => 3, 
        :assists => 2, 
        :steals => 1, 
        :blocks => 1, 
        :slam_dunks => 0
      }, 
      { 
        :player_name => "Kemba Walker",
        :number => 33, 
        :shoe => 15, 
        :points => 6, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 7, 
        :blocks => 5, 
        :slam_dunks => 12
      }]
    }
  }
  game_hash
end

def num_points_scored(player_name) 
  player_points = 0
  game_hash.each do |location, team_data|
    player_arr = game_hash[location][:players]
    player_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, value|
        if attribute_hash[attribute] == player_name
          player_points = attribute_hash[:points]
        end
      end
    end
  end 
  player_points  
end

def shoe_size(player_name)
  player_shoe_size = 0
  game_hash.each do |location, team_data|
    player_arr = game_hash[location][:players]
    player_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, value|
        if attribute_hash[attribute] == player_name
          player_shoe_size = attribute_hash[:shoe]
        end
      end
    end
  end 
  player_shoe_size
end

def team_colors(team_name)
  team_colors_arr = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team_name
      team_colors_arr = game_hash[location][:colors]
    end
  end
  team_colors_arr
end

def team_names
  team_names_arr = []
  game_hash
  game_hash.each do |location, team_data|
    team_names_arr << team_data[:team_name]
  end
  team_names_arr
end

def player_numbers(team_name)
  jersey_arr = []
  game_hash.each do |location, team_data|
    player_arr = game_hash[location][:players]
    if game_hash[location][:team_name] == team_name
      player_arr.each do |attribute_hash|
        jersey_arr << attribute_hash[:number]
      end
    end
  end
  jersey_arr
end