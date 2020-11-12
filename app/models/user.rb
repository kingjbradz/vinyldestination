class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }, uniqueness: true

  validates_presence_of :username

  has_many :vinyls
end
