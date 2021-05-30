class Suggestion < ApplicationRecord
	delegated_type :suggestable, types: %w[ Category Player Match ], dependent: :destroy
  enum status: { pending: 0, reopened: 1, closed: 2} 
  validates_presence_of :title, :description
end