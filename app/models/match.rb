class Match < ApplicationRecord
    belongs_to :winner, class_name: "Player", foreign_key: "winner_id"
    belongs_to :loser,  class_name: "Player", foreign_key: "loser_id"

    validates :winner_id, presence: true
    validates :loser_id, presence: true
end
