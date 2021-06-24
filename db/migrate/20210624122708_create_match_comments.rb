class CreateMatchComments < ActiveRecord::Migration[6.1]
  def change
    create_table :match_comments do |t|
      t.string :descrption
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
