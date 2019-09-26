require "pry"
def game_hash
  
final_hash ={
  :home => {
  team_name: "Brooklyn Nets",
  colors: ["Black", "White"],
  players: [{
    "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
    "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
    "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
    "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
    "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
  }]
},
:away => {
  team_name: "Charlotte Hornets",
  colors: ["Turquoise","Purple"],
  players: [{
    "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
    "Bismack Biyombo" =>{number: 0, shoe: 16, points: 12, rebounds: 4,assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
    "DeSagna Diop" =>{number: 2, shoe: 14, points: 24, rebounds: 12,assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
    "Ben Gordon" =>{number: 8, shoe: 15, points: 33, rebounds: 3,  assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
    "Kemba Walker" =>{number: 33, shoe: 15, points: 6, rebounds: 12,assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
  }]
}
}
end

def num_points_scored(name)
  scored =0
game_hash.each do |home_away, teams_infos|
  teams_infos.each do |key,val|
   game_hash[home_away][:players][0].each do |player_name, player_info|
 if name  == player_name
  scored= player_info[:points]
 end
   end
  end
end
scored
end

def shoe_size(name)
shoes_siz =0
game_hash.each do |home_away, teams_infos|
  teams_infos.each do |key,val|
   game_hash[home_away][:players][0].each do |player_name, player_info|
 if name  == player_name
  shoes_siz= player_info[:shoe]
 end
   end
  end
end
shoes_siz
end

def team_colors(arg)
  game_hash.each do |home_away, teams_values|
   teams_values.each do |k,v|
    if v.include?(arg)
      return game_hash[home_away][:colors]
    end
    end
  end
end


def team_names
  answer= []
  game_hash.each do |home_away, teams_values|
   answer << game_hash[home_away][:team_name]
  end
 answer
end
 

def player_numbers(arg)
  answer=[]
  game_hash.each do |home_away, teams_values|
  teams_values.each do |k,v|
 game_hash[home_away].values[2][0].each do |singler_player, single_player_info|
  if game_hash[home_away][:team_name] == arg
     answer << single_player_info[:number]
 end
end
 end
end
answer.sort.uniq
 end

 def player_stats(arg)
final_hash = {}
game_hash.each do |home_away, teams_values|
teams_values.each do |k,v|
   game_hash[home_away].values[2][0].each do |singler_player, single_player_info|
if singler_player == arg
  final_hash = single_player_info
  end
end
end
end
final_hash.sort_by {|k1,v1| k1}.to_h
 end


 def big_shoe_rebounds
  last = 0
  answer=0
  new_siz = 0
  game_hash.each do |home_away,teams_values|
    teams_values.each do |k,v|
      game_hash[home_away][:players][0].each do |singler_player,single_player_info|
        last= single_player_info[:shoe] 
        if last > new_siz
          new_siz = last
          answer=  single_player_info[:rebounds]
      end
      end
    end
   end
   answer
 end
 
  def most_points_scored
  old_point= 0
  new_point = 0
  name=""
   game_hash.each do |home_away, teams_values|
      game_hash[home_away][:players][0].each do |k,v|
      old_point= v[:points]
      if old_point > new_point
        new_point = old_point
        name = k
      end
      end
  end
  name
 end


 def winning_team
home_point=[]
away_point = []
game_hash[:home][:players][0].each do |k,v|
home_point << v[:points]
# binding.pry
end
game_hash[:away][:players][0].each do |k2,v2|
away_point << v2[:points]
end
if away_point.sum > home_point.sum
  return game_hash[:away][:team_name]
else
  return game_hash[:home][:team_name]
end
 end
 
def player_with_longest_name
  new_name = 0
  wining_name = []
   game_hash.each do |home_away, teams_values|
     game_hash[home_away][:players][0].each do |names,values|
      names
     if names.length > new_name
       new_name = names.length
       wining_name << names
     end
    end
   end
   wining_name[0].length > wining_name[1].length ? wining_name[0] : wining_name[1]
 end


def long_name_steals_a_ton?
  old_steal = 0
  new_steal = 0
  answer = ""
  game_hash.each do |home_away, teams_values|
    game_hash[home_away][:players][0].each do |names,values|
    old_steal =  values[:steals]
    if old_steal > new_steal
      new_steal = old_steal
      answer = names
    end
    end
  end
  answer == player_with_longest_name ? true : false
 end






