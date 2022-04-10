class Comment < ApplicationRecord
  # Validations
  validates :body, presence: true
  # Associations
  belongs_to :user, counter_cache: true
end
