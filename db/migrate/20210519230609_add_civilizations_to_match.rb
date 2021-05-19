class AddCivilizationsToMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :player_1_civilization, :string
    add_column :matches, :player_2_civilization, :string
    add_column :matches, :vote_player_1, :integer
    add_column :matches, :vote_player_2, :integer
  end
end
