class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.text :bio
      t.integer :rank
      t.integer :age
      t.datetime :birthday
      t.integer :likes

      t.timestamps
    end
  end
end
