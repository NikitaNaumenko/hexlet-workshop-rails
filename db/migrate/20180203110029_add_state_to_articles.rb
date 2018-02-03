class AddStateToArticles < ActiveRecord::Migration[5.1]
  def up
    add_column :articles, :state, :string
  end

  def down
    remove_column :articles, :state
  end
end
