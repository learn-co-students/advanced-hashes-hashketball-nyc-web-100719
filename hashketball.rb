require "pry"

def game_hash
{
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        # array of hashes
        #each hash should contain players stats as listed. Stats are keys
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
       }
     ] #this is end bracket for "players" array
    }, #this is end bracket for "home" hash
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>
        [ #beginning of "players" bracket
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
        { :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]# end bracket of players
    } #this is end of bracket of "away" hash
  } #end of whole "hash" bracket
end


def num_points_scored(players_name)
  #return num of points for player passed in
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player_stats|
          if player_stats[:player_name] == players_name
            return player_stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  # how to access the shoe size
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player_stats|
        if player_stats[:player_name] == players_name
          return player_stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
    return team[:colors]
    end
  end
end

def team_names
  newArray = []
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :team_name
          newArray << data
      end
    end
  end
 newArray
end

def player_numbers(team_name)
  numbersArray = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player_stats|
            numbersArray << player_stats[:number]
          end
        end
      end
    end
  end
  numbersArray
end

#vs could use game_hash.map instead? stumped? and then from there .each everything
#with .map, no need to create empty array and push onto an array and return that array
#instead with .map, you can return player[:number]?? didn't work in example

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
              if player[:player_name] == players_name
                new_hash = player.delete_if do |k, v|
                   k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0

  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player_statistics|
          size = player_statistics[:shoe]
            if size > largest_shoe
              largest_shoe = size
              rebounds = player_statistics[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  playerWiththeMost = ""

  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player_statistics|
          numPoints = player_statistics[:points]
            if numPoints > most_points
              most_points = numPoints
              playerWiththeMost = player_statistics[:player_name]
          end
        end
      end
    end
  end
  playerWiththeMost
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      if place == :home
        home_points += player[:points]
      elsif place == :away
        away_points += player[:points]
      end
    end
  end
    if home_points > away_points
      game_hash[:home][:team_name]
    elsif home_points < away_points
      game_hash[:away][:team_name]
  end
end


#team is the whole hash within :home (it includes :team name, :colors, :players
#attribute is :team_name :colors and :players
#data is Brooklyn Nets
#data is also player stats Ex :player_name , :number, :shoe
def player_with_longest_name
  longest_length = 0
  playerWithLongestName = ""

  game_hash.each do |place, team|
    team[:players].each do |player|
    nameLength = player[:player_name].length
    if nameLength > longest_length
      longest_length = nameLength
      playerWithLongestName = player[:player_name]
      end
    end
  end
  playerWithLongestName
end

#practice for super bonus
def most_steals
  mostSteals = 0
  playerWithMostSteals = ""

  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          numSteals = player[:steals]
            if numSteals > mostSteals
              mostSteals= numSteals
              playerWithMostSteals = player[:player_name]
          end
        end
      end
    end
  end
  playerWithMostSteals
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    true
  else
    false
  end
end
