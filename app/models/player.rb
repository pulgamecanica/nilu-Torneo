class Player < ApplicationRecord
	belongs_to :category
	has_many :player_1_matches, class_name: "Match", foreign_key: 'player_1_id'
	has_many :player_2_matches, class_name: "Match", foreign_key: 'player_2_id'
	has_many :winner_matches, class_name: "Match", foreign_key: 'winner_id'
end
