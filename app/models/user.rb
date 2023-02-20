class User < ApplicationRecord
    validates :username , presence: true , length: {minimum: 4, maximum: 30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email , presence: true , length: { maximum: 80}, format: { with: VALID_EMAIL_REGEX} 
end