class Article < ApplicationRecord
  has_many :comments, class_name: 'Article::Comment', dependent: :destroy
  belongs_to :category, required: false
  validates :title, presence: true,
                    length: { minimum: 5 }
  state_machine :state, initial: :draft do

    state :draft do

    end

    state :moderation do

    end

    state :published do

    end
  end
end
