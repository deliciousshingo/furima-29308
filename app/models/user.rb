class User < ApplicationRecord
  has_many :items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :email, format: { with: /[a-z\d]@+/i }
    validates :password, format: { with: /[a-z\d]/i }
    validates :encrypted_password, format: { with: /[a-z\d]/i }
  end
end
