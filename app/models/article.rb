class Article < ApplicationRecord
  has_many :comments, class_name: 'Article::Comment', dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
