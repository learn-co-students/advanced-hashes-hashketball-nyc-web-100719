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

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, team_data|
    player_arr = game_hash[location][:players]
    player_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, hash|
        if attribute_hash[:player_name] == player_name
          stats = {
            :number => attribute_hash[:number], 
            :shoe => attribute_hash[:shoe],
            :points => attribute_hash[:points],
            :rebounds => attribute_hash[:rebounds],
            :assists => attribute_hash[:assists], 
            :steals => attribute_hash[:steals], 
            :blocks => attribute_hash[:blocks], 
            :slam_dunks => attribute_hash[:slam_dunks]
          }
        end
      end 
    end
  end
  stats
end

def big_shoe_rebounds
  shoe_size = 0 
  player_rebounds = 0
  game_hash.each do |location, team_data|
    players_arr = game_hash[location][:players]
    players_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, value|
        if attribute_hash[:shoe] > shoe_size
          shoe_size = attribute_hash[:shoe]
          player_rebounds = attribute_hash[:rebounds]
        end
      end 
    end
  end 
  player_rebounds
end

def most_points_scored
  most_points = 0
  most_points_player = ""
  game_hash.each do |location, team_data|
    players_arr = game_hash[location][:players]
    players_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, value|
        if attribute_hash[:points] > most_points
          most_points = attribute_hash[:points]
          most_points_player = attribute_hash[:player_name]
        end
      end 
    end
  end
  most_points_player
end

def winning_team
  team1_name = game_hash[:home][:team_name]
  team2_name = game_hash[:away][:team_name]
  team1_points = 0
  team2_points = 0
  game_hash[:home][:players].each do |attribute, value|
    team1_points = team1_points + attribute[:points]
  end
  game_hash[:away][:players].each do |attribute, value|
    team2_points = team2_points + attribute[:points]
  end
  winning_team_name = team1_points > team2_points ? team1_name : team2_name
  winning_team_name 
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    players_arr = game_hash[location][:players]
    players_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, value|
        attribute_hash[:player_name].length > longest_name.length ? longest_name = attribute_hash[:player_name] : longest_name
      end    
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  longest_name_steals = 0
  longest_name_most_steals = ""
  game_hash.each do |location, team_data|
    players_arr = game_hash[location][:players]
    players_arr.each do |attribute_hash|
      attribute_hash.each do |attribute, value|
        if attribute_hash[:player_name] == longest_name
          longest_name_steals = attribute_hash[:steals]
        end
        if longest_name_steals > attribute_hash[:steals]
          longest_name_most_steals = true
        else 
          longest_name_most_steals = false
        end
      end
    end
  end
  longest_name_most_steals
end



