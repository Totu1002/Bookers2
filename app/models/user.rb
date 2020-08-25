class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :book, dependent: :destroy
  #プロフィール画像設定用
  attachment :profile_image

  #validates :name, {presence: true}
  #validates :email, {presence: true, uniqueness: true}
  # passwordカラムにバリデーションを設定してください
  #validates :password, {presence: true}
end
