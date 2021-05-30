class AddSeedingToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :seeding, :integer
  end
end
