require "pry"
stat_hash ={}
def game_hash
  stat_hash={
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [{"Alan Anderson" => {:number => 0, :shoe => 16, :points =>22, :rebounds => 12, :assists => 12, :steals =>3, :blocks => 1, :slam_dunks => 1}}, {"Reggie Evans" => {:number => 30, :shoe => 14, :points =>12, :rebounds => 12, :assists => 12, :steals =>12, :blocks => 12, :slam_dunks => 7}}, {"Brook Lopez" => {:number => 11, :shoe => 17, :points =>17, :rebounds => 19, :assists => 10, :steals =>3, :blocks => 1, :slam_dunks => 15}}, {"Mason Plumlee" => {:number => 1, :shoe => 19, :points =>26, :rebounds => 11, :assists => 6, :steals =>3, :blocks => 8, :slam_dunks => 5}}, {"Jason Terry" => {:number => 31, :shoe => 15, :points =>19, :rebounds => 2, :assists => 2, :steals =>4, :blocks => 11, :slam_dunks => 1}}]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [{"Jeff Adrien" => {:number => 4, :shoe => 18, :points =>10, :rebounds => 1, :assists => 1, :steals =>2, :blocks => 7, :slam_dunks => 2}}, {"Bismack Biyombo" => {:number => 0, :shoe => 16, :points =>12, :rebounds => 4, :assists => 7, :steals =>22, :blocks => 15, :slam_dunks => 10}}, {"DeSagna Diop" => {:number => 2, :shoe => 14, :points =>24, :rebounds => 12, :assists => 12, :steals =>4, :blocks => 5, :slam_dunks => 5}}, {"Ben Gordon" => {:number => 8, :shoe => 15, :points =>33, :rebounds => 3, :assists => 2, :steals =>1, :blocks => 1, :slam_dunks => 0}}, {"Kemba Walker" => {:number => 33, :shoe => 15, :points =>6, :rebounds => 12, :assists => 12, :steals =>7, :blocks => 5, :slam_dunks => 12}}]
    }
    
  }
end 

def num_points_scored(name)
  points = {} 
  game_hash.each_key do |key1|
    i = 0
    while game_hash[key1][:players].length > i do  
      game_hash[key1][:players][i].each_key do |key2|
        if key2 == name 
          points[name] = game_hash[key1][:players][i][name][:points] 
        end 
      end 
      i +=1 
    end 
  
  end 
  points[name] 
end 

def shoe_size(name)
  size = {} 
  game_hash.each_key do |key1|
    i = 0
    while game_hash[key1][:players].length > i do  
      game_hash[key1][:players][i].each_key do |key2|
        if key2 == name 
          size[name] = game_hash[key1][:players][i][name][:shoe] 
        end 
      end 
      i +=1 
    end 
  
  end 
  size[name] 
end

def team_colors(team)
  color = {}
  game_hash.each_key do |key1|
    if game_hash[key1][:team_name] == team 
      color[team] = game_hash[key1][:colors]
    end 
  end 
  color[team]
end 

def team_names
  teams = []
  game_hash.each_key do |key1|
    teams = teams.push(game_hash[key1][:team_name])
  end
  teams 
end 

def player_numbers(team)
  jersey_numbers = []
  game_hash.each_key do |key1|
    if game_hash[key1][:team_name] == team 
      i =0 
      while game_hash[key1][:players].length > i do 
        game_hash[key1][:players][i].each_key do |name|
          jersey_numbers = jersey_numbers.push(game_hash[key1][:players][i][name][:number]) 
        end 
        
        i +=1
      end
    end 
  end
  jersey_numbers
end

def player_stats(name)
  stats = {} 
  game_hash.each_key do |key1|
    i = 0
    while game_hash[key1][:players].length > i do  
      game_hash[key1][:players][i].each_key do |key2|
        if key2 == name 
          stats[name] = game_hash[key1][:players][i][name] 
        end 
      end 
      i +=1 
    end 
  
  end 
  stats[name] 
end

def big_shoe_rebounds
  rebounds = {} 
  rebounds[:shoe_size] = 0
  game_hash.each_key do |key1|
    i = 0
    while game_hash[key1][:players].length > i do  
      game_hash[key1][:players][i].each_key do |key2|
        if game_hash[key1][:players][i][key2][:shoe] > rebounds[:shoe_size]
          rebounds[:shoe_size] = game_hash[key1][:players][i][key2][:shoe]
          rebounds[:boards] = game_hash[key1][:players][i][key2][:rebounds]
        end 
      end
      i +=1 
    end
  end
  rebounds[:boards]
end 

def most_points_scored
  name = ""
  most_points = 0 
  game_hash.each_key do |key1|
    i = 0 
    while game_hash[key1][:players].length > i do 
      game_hash[key1][:players][i].each_key do |key2|
        if game_hash[key1][:players][i][key2][:points] > most_points
          name = key2
          most_points = game_hash[key1][:players][i][key2][:points]
        end 
      end
      i +=1
    end 
  end 
  name 
end 

def winning_team
  team_score = {}
  game_hash.each_key do |key1|
    team_score[key1]=0 
    i = 0 
    while game_hash[key1][:players].length > i do 
      game_hash[key1][:players][i].each_key do |name|
        team_score[key1] += game_hash[key1][:players][i][name][:points]
      end 
    i +=1
    end 
  end
  if team_score[:away] > team_score[:home]
    game_hash[:away][:team_name]
  else 
    game_hash[:home][:team_name]
  end 
end 

def player_with_longest_name
  name = ""
  game_hash.each_key do |key1|
    i = 0 
    while game_hash[key1][:players].length > i do 
      game_hash[key1][:players][i].each_key do |key2|
        if key2.chars.length > name.chars.length 
          name = key2
        end 
      end
      i +=1
    end 
  end 
  name
end 

def long_name_steals_a_ton?
  name = ""
  game_hash.each_key do |key1|
    i = 0 
    while game_hash[key1][:players].length > i do 
      game_hash[key1][:players][i].each_key do |key2|
        if key2.chars.length > name.chars.length 
          name = key2
        end 
      end
      i +=1
    end 
  end 
  name
  most_steals = 0
  name_steals = ""
  game_hash.each_key do |key1|
    i = 0 
    while game_hash[key1][:players].length > i do 
      game_hash[key1][:players][i].each_key do |key2|
        if game_hash[key1][:players][i][key2][:steals] > most_steals
          name_steals = key2
          most_steals = game_hash[key1][:players][i][key2][:steals]
        end 
      end
      i +=1
    end 
  end 
  return name == name_steals
end 


