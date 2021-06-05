class RemoveNullFromMatches < ActiveRecord::Migration[6.1]
  def change
  	change_column_null :matches, :player_1_id, true
  	change_column_null :matches, :player_2_id, true
  end
end
