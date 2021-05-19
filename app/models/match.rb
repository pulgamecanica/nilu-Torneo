class Match < ApplicationRecord
  belongs_to :category
  belongs_to :player_1, class_name: "Player", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "Player", foreign_key: :player_2_id
  belongs_to :winner, class_name: "Player", foreign_key: :winner_id, optional: true
  validates :round, presence: true
  validate :valid_match_users, :valid_winner
  @@civilizations = ['Chinese', 'Persians', 'Aztecs', 'Mayans', 'Malians', 'Huns', 'Khmer', 'Britons', 'Incas', 'Franks', 'Slavs', 'Mongols', 'Celts', 'Lithuanians', 'Japanese', 'Spanish', 'Magyars', 'Berbers', 'Cumans', 'Byzantines', 'The Ethiopians', 'Bulgarians', 'Vikings', 'Saracens', 'Teutons', 'Indians', 'Burmese', 'Koreans', 'Portuguese', 'Tatars', 'Italians', 'Malay', 'Vietnamese', 'Turks', 'Goths'].freeze
  attr_reader :civilizations
  private
    def valid_match_users
    	errors.add(:player_2, "must be different!") if player_2.eql? player_1
    	errors.add(:player_1, " and player 2 must be on the same category!") if not player_2.category.eql? player_1.category
    	errors.add(:category, " doesn't match the players!") if not((category.eql? player_1.category) && (category.eql? player_2.category))
    end
    def valid_winner
    	errors.add(:winner, "should exist in the match!") if not ((player_1.eql? winner) || (player_2.eql? winner)  || (winner.nil?))
    end
end
