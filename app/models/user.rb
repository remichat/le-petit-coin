class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :phone_number, :address, presence: true
  validates :phone_number, uniqueness: true, format: { with: /\d{8,10}/,
    message: "should be a valid phone number modafoka" }
end
