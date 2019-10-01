# Write your code here!
def game_hash
  
  topHash = Hash.new
  
  topHash = {
    home: Hash.new,
    away: Hash.new
  }
  
  #home
  topHash[:home] = {
    team_name: "Brooklyn Nets",
    colors: ["Black","White"],
    players: [
        { #Alan Anderson
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        { #Reggie Evans
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        { #Brook Lopez
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        { #Mason Plumlee
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { #Jason Terry
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
  }
  
  
  
  #away
  topHash[:away] = {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise","Purple"],
    players: [
        { #Jeff Adrien
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        { #Bismack Biyombo
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        { #DeSagna Diop
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        { #Ben Gordon
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        { #Kemba Walker
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
  }
  
  topHash
  
end

def getPlayerArray
  
  array = [
    "Alan Anderson",
    "Reggie Evans",
    "Brook Lopez",
    "Mason Plumlee",
    "Jason Terry",
    "Jeff Adrien",
    "Bismack Biyombo",
    "DeSagna Diop",
    "Ben Gordon",
    "Kemba Walker"
    ]
  
end

def isPlayerOnNets(player)
  
  hash = Hash.new
  
  hash = {
    "Alan Anderson" => 0,
    "Reggie Evans" => 1,
    "Brook Lopez" => 2,
    "Mason Plumlee" => 3,
    "Jason Terry" => 4,
  }
  
  return (hash.key?(player))
  

end



def playerIndexNumberHome(player)
  
  hash = Hash.new
  
  hash = {
    "Alan Anderson" => 0,
    "Reggie Evans" => 1,
    "Brook Lopez" => 2,
    "Mason Plumlee" => 3,
    "Jason Terry" => 4,
  }
  
  return hash[player]
  
end

def playerIndexNumberAway(player)
  
  hash = Hash.new
  
  hash = {
    "Jeff Adrien" => 0,
    "Bismack Biyombo" => 1,
    "DeSagna Diop" => 2,
    "Ben Gordon" => 3,
    "Kemba Walker" => 4,
  }
  
  return hash[player]
  
end


def num_points_scored(player)

if (isPlayerOnNets(player))
  index = playerIndexNumberHome(player)
  points = game_hash[:home][:players][index][:points]
else
  index = playerIndexNumberAway(player)
  points = game_hash[:away][:players][index][:points]
end

points

end


def num_steals(player)

if (isPlayerOnNets(player))
  index = playerIndexNumberHome(player)
  steals = game_hash[:home][:players][index][:steals]
else
  index = playerIndexNumberAway(player)
  steals = game_hash[:away][:players][index][:steals]
end

steals

end


def shoe_size(player)

if (isPlayerOnNets(player))
  index = playerIndexNumberHome(player)
  shoe = game_hash[:home][:players][index][:shoe]
else
  index = playerIndexNumberAway(player)
  shoe = game_hash[:away][:players][index][:shoe]
end

shoe

end


def player_stats(player)

if (isPlayerOnNets(player))
  index = playerIndexNumberHome(player)
  playerStat = game_hash[:home][:players][index]
else
  index = playerIndexNumberAway(player)
  playerStat = game_hash[:away][:players][index]
end

playerStat

end

def team_colors(teamName)
  colors = []
  game_hash.each_key { |key|
    
    if (game_hash[key][:team_name] == teamName)
      colors = game_hash[key][:colors]
    end
    
  }
  
  colors 
end

def team_names
  array = []
   game_hash.each { |key, value|
    
    array.push(value[:team_name])
    
  }
  array
end

def player_numbers(teamName)
  array = []
  game_hash.each { |key, value|
    
    if (value[:team_name] == teamName)
     value[:players].each { |v|
      array.push(v[:number])
       
     }
    end
  }
  
  array
end

def big_shoe_rebounds
  max = -1
  hash = Hash.new
  game_hash.each { |key, value|
    value[:players].each{ |v|
      if (v[:shoe] > max)
        max = v[:shoe]
        hash = v
      end
    }
  }
  hash[:rebounds]
end


def most_points_scored
  max = -1
  player = ""
  getPlayerArray.each { |n|
    
    if (num_points_scored(n) > max)
      max = num_points_scored(n)
      player = n
    end
    
  }
  
  player
  
end

def winning_team
  sumHome = 0
  sumAway = 0
  getPlayerArray.each { |n|
  
    if isPlayerOnNets(n)
      sumHome += num_points_scored(n)
    else
      sumAway += num_points_scored(n)
    end
    
  }
  
  if (sumHome > sumAway)
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
  
end

def player_with_longest_name
  length = -1
  name = ""
  getPlayerArray.each{ |n|
  
    if (n.size> length)
      length = n.size
      name = n
    end
    
  }
  name
end


def long_name_steals_a_ton?
  
  longestNameSteals = num_steals(player_with_longest_name)
  otherStealMax = -1
  
  getPlayerArray.each{ |n|
  
    if (n == player_with_longest_name)
      #do nothing
    else
      if (num_steals(n) > otherStealMax)
        otherStealMax = num_steals(n)
      end
    end  
  
  }
  
  return (longestNameSteals > otherStealMax)
  
end