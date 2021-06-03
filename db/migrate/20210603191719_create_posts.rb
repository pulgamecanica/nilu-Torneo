class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :link1
      t.string :link2
      t.boolean :active

      t.timestamps
    end
  end
end
