class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms

  validates :name, uniqueness: true
  validates :name, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}

  attachment :profile_image

end
