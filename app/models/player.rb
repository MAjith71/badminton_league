class Player < ApplicationRecord
    has_many :matches_as_winner, class_name: "Match", foreign_key: "winner_id", dependent: :destroy
    has_many :matches_as_loser,  class_name: "Match", foreign_key: "loser_id", dependent: :destroy

    def wins
        matches_as_winner.count
    end

    def losses
        matches_as_loser.count
    end

    def total_matches
        wins + losses
    end

    def winning_percentage
        return 0 if total_matches.zero?
        ((wins.to_f / total_matches) * 100).round(2)
    end
end
