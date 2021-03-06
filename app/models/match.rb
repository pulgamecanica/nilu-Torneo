class Match < ApplicationRecord
  belongs_to :category
  belongs_to :player_1, class_name: "Player", foreign_key: :player_1_id, optional: true
  belongs_to :player_2, class_name: "Player", foreign_key: :player_2_id, optional: true
  belongs_to :winner, class_name: "Player", foreign_key: :winner_id, optional: true
  has_many :suggestion, as: :suggestable
  validates_presence_of :round
  validate :valid_match_users, :valid_winner
  private
    def valid_match_users
      if not (player_2.nil? || player_1.nil?)
    	  errors.add(:player_2, "must be different!") if player_2.eql? player_1
    	  errors.add(:player_1, " and player 2 must be on the same category!") if not player_2.category.eql? player_1.category
      end
      if player_2.nil? && player_1.nil?
        errors.add(:match, "You must choose at least one player")
        return
      elsif (not player_2.nil?) && (not player_1.nil?)
    	errors.add(:category, " doesn't match the players!") if not((category.eql? player_1.category) && (category.eql? player_2.category))
      end
    end
    def valid_winner
    	errors.add(:winner, "should exist in the match!") if not ((player_1.eql? winner) || (player_2.eql? winner)  || (winner.nil?))
    end
end
