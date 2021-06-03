class AddLinkNamesToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :link1_name, :string
    add_column :posts, :link2_name, :string
  end
end
