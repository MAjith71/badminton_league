class LeaderboardController < ApplicationController
  def index
    @players = Player.all.sort_by do |p|
      [-p.wins, -p.winning_percentage]
    end
  end
end