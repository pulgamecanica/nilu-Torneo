class AddBracketsLinkToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :brackets_link, :string
  end
end
