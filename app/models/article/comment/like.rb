class Article
  class Comment
    class Like < ApplicationRecord
      belongs_to :comment
      scope :desc_ordered, -> { order(created_at: :desc) }
      scope :time_restraint, -> { where('created_at > ?', 1.hour.ago) }
    end
  end
end
