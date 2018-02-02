class Article
  class Comment < ApplicationRecord
    belongs_to :article, class_name: 'Article'
  end
end
