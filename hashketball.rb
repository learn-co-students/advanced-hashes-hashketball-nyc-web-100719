# Write your code here!
require 'pry'
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        {  
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1},
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
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2},
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
 # binding.pry
end

def num_points_scored(player)
  game_hash.each do |home_away, team_info|
    i = 0 
    while i< team_info[:players].length
      if team_info[:players][i][:player_name] == player
        return team_info[:players][i][:points]
      end
      i += 1 
    end
  end  
end

def shoe_size(player)
  game_hash.each do |home_away, team_info|
    i = 0 
    while i< team_info[:players].length
      if team_info[:players][i][:player_name] == player
        return team_info[:players][i][:shoe]
      end
      i += 1 
    end
  end  
end

def team_colors(team)
  game_hash.each do |home_away, team_info|
      if team_info[:team_name] == team
        return team_info[:colors]
      end
  end  
end

def team_names
  team_name_array = []
  game_hash.each do |home_away, team_info|
   # binding.pry
    if team_info[:team_name]
      team_name_array.push(team_info[:team_name])
    end
  end
  team_name_array
end

def player_numbers(team_name)
  number_array = []
  game_hash.each do |home_away, team_info|
    if team_name == team_info[:team_name]
      i=0 
      while i< team_info[:players].length
         number_array.push(team_info[:players][i][:number])
        i += 1 
      end
    end
  end 
  number_array
end

def player_stats(player)
   game_hash.each do |home_away, team_info|
     i = 0 
     while i < team_info[:players].length
      if team_info[:players][i][:player_name] == player 
        
        team_info[:players][i].delete(:player_name)
        return team_info[:players][i]
      end
      i += 1 
     end 
   end 
end

def big_shoe_rebounds
  game_hash.each do |home_away, team_info|
    i = 0 
    max = 0 
    new_rebounds = 0 
    while i< team_info[:players].length
      if  team_info[:players][i][:shoe] > max
         max = team_info[:players][i][:shoe]
         new_rebounds = team_info[:players][i][:rebounds] 
      end 
     i += 1 
    end
   return new_rebounds
  end
end




