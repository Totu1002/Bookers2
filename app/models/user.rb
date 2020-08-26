class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  #プロフィール画像設定用
  attachment :profile_image

  #validates :email, {presence: true, uniqueness: true}
  # passwordカラムにバリデーションを設定してください
  #validates :password, {presence: true}
  validates :name, presence: true, length: {minimum: 2,maximum: 20}
  validates :introduction, length: {maximum: 50}
end
