# Write your code here!
require "pry"

def game_hash
  {home:{team_name: "Brooklyn Nets", colors: ["Black","White"], players:[{player_name:"Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},{player_name:"Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},{player_name:"Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},{player_name:"Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},{player_name:"Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}]}, away:{team_name: "Charlotte Hornets", colors: ["Turquoise","Purple"], players:[{player_name:"Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},{player_name:"Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks:10 },{player_name:"DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},{player_name:"Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},{player_name:"Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}]}
  }
end

def num_points_scored(player)
  game_hash[:home][:players].each{|ind_play|
    return ind_play[:points] if ind_play[:player_name] == player
  }
  game_hash[:away][:players].each{|ind_play|
    return ind_play[:points] if ind_play[:player_name] == player
  }
end 

def shoe_size(player)
  game_hash[:home][:players].each{|ind_play|
    return ind_play[:shoe] if ind_play[:player_name] == player
  }
  game_hash[:away][:players].each{|ind_play|
    return ind_play[:shoe] if ind_play[:player_name] == player
  }
end

def team_colors(team)
  return game_hash[:home][:colors] if game_hash[:home][:team_name] == team
  return game_hash[:away][:colors] if game_hash[:away][:team_name]== team
end 

def team_names
  teams = []
  game_hash.each{|section, div|
  teams << div[:team_name]
  }
  teams
end

def player_numbers(team)
jerseys = []
if game_hash[:home][:team_name] == team
path = game_hash[:home][:players]
else
path = game_hash[:away][:players]
end
path.each{|ind_player|
jerseys << ind_player[:number]
}
jerseys
end

def player_stats(player)
  player_data ={}
  game_hash.each{|ind, other|
  other[:players].each{|indplay|
  if indplay[:player_name] == player
  player_data = indplay
  player_data.delete(:player_name)
  end
  }
  }
  player_data
end

def big_shoe_rebounds
player_shoe = nil;
play_w_biggest_s = nil;
game_hash.each{|location, team|
  team[:players].each{|indplayer|
  if player_shoe == nil
    player_shoe = indplayer[:shoe]
    play_w_biggest_s = indplayer[:player_name]
  elsif indplayer[:shoe] > player_shoe
  player_shoe = indplayer[:shoe]
  play_w_biggest_s = indplayer[:player_name]
  end
  }
}
player_stats(play_w_biggest_s)[:rebounds]
end

def most_points_scored
  player = nil
  score = nil
  game_hash.each{|location, team|
  team[:players].each{|indplayer|
  if score == nil
    score = indplayer[:points]
    player = indplayer[:player_name]
  elsif indplayer[:points] > score
  score = indplayer[:points]
  player= indplayer[:player_name]
  end
    }
  }
player
end

def winning_team
home_score = add_score(game_hash[:home])
visit_score = add_score(game_hash[:away])
return game_hash[:home][:team_name] if home_score > visit_score
end

def add_score(path)
  points = 0
  path[:players].each{|indplayer|
    points += indplayer[:points]
  }
  points
end

def player_with_longest_name
  longest_name = nil
  game_hash.each{|location, team|
  team[:players].each{|indplayer|
  if longest_name == nil
    longest_name= indplayer[:player_name]
  elsif indplayer[:player_name].length > longest_name.length
  longest_name = indplayer[:player_name]
  end
  }
}
longest_name
end

def steals
  big_steal = nil
  game_hash.each{|location, team|
  team[:players].each{|indplayer|
  if big_steal == nil
    big_steal= indplayer[:steals]
  elsif indplayer[:steals] > big_steal
    big_steal = indplayer[:steals]
  end
  }
}
big_steal
end

def long_name_steals_a_ton?
actual_steals = steals
longest_name = player_with_longest_name
return true if player_stats(longest_name)[:steals] == actual_steals
false
end
  