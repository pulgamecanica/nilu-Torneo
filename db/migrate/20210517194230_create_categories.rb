class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.boolean :active
      t.integer :min_rank
      t.integer :max_rank
      t.text :register_link
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
