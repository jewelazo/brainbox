class User < ApplicationRecord
    # Validations
    validates :username,:email, presence: true , uniqueness: true
    
    # Associations
    has_many :comments, dependent: :destroy
end
