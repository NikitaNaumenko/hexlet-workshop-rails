class Article
  class Category < ApplicationRecord
    has_many :articles
  end
end
