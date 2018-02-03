class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :links
  belongs_to :category, required: false
  validates :title, presence: true,
                    length: { minimum: 5 }
  state_machine :state, initial: :draft do
    state :draft
    state :on_moderation
    state :published

    event :send_to_draft do
      transition :on_moderation => :draft
    end

    event :send_to_moderation do
      transition :draft => :on_moderation
    end

    event :publish do
      transition :on_moderation => :published
    end
  end

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
end
