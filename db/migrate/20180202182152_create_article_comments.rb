class CreateArticleComments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comments do |t|
      t.string :commentor
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
