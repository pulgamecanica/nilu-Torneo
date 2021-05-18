class AddRoundToMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :round, :integer
  end
end
