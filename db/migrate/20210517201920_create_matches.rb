class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.datetime :date
      t.references :category, null: false, foreign_key: true
      t.references :player_1, null: false, foreign_key: { to_table: :players }
      t.references :player_2, null: false, foreign_key: { to_table: :players }
      t.references :winner, null: true, foreign_key: { to_table: :players }
      t.integer :likes

      t.timestamps
    end

  end
end
