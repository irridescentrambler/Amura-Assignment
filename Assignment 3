class Game
  def play(matches)
    matches.each do |match|
      result = match.split(";")
      first_team = Team.find_or_initialize(result[0])
      second_team = Team.find_or_initialize(result[1])
      outcome = result[2]
      case outcome
      when "win"
        first_team.wins!
        second_team.lose!
      when "loss"
        second_team.wins!
        first_team.lose!
      when "draw"
        [first_team, second_team].map(&:draws!) 
      end
    end
  end

  def outcome
    output = Team.all.map do |team| 
      [
        team.name,
        team.matches_played,
        team.total_wins,
        team.total_draws,
        team.total_losses,
        team.points
      ] 
    end.sort_by!{|stats| stats.last }.reverse!
    puts ["Team", "MP", "W", "D", "L", "P"].join("|")
    output.each do |individual_output| 
      puts individual_output.join("|")
    end
  end
end

class Team
  attr_accessor :name, :points, :matches_played, 
                :total_wins, :total_losses, :total_draws
  def initialize(name)
    @name = name
    @points = 0
    @matches_played = 0
    @total_wins = 0
    @total_losses = 0
    @total_draws = 0
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.find_or_initialize(name)
    find(name) || new(name)
  end

  def self.find(name)
    ObjectSpace.each_object(self).to_a.select do |team|       team.name == name
    end.first
  end

  def play
    self.matches_played += 1
  end

  def wins!
    play
    self.points += 3
    self.total_wins += 1
  end

  def draws!
    play
    self.points += 1
    self.total_draws += 1
  end

  def lose!
    play
    self.total_losses += 1
  end
end

test_input = [
  "Team B;Team C;win", 
  "Team A;Team D;draw", 
  "Team A;Team B;win"
]

game = Game.new
game.play(test_input)
game.outcome
