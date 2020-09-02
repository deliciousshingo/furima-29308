class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :email, format: { with: /[a-z\d]{6,}@.+/i }
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :encrypted_password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end
end
