class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :description
			t.string  :suggestable_type, null: false
    	t.integer :suggestable_id, null: false
    	t.integer :status, :default => 0

      t.timestamps
    end
  end
end
