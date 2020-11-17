class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }, uniqueness: true

  validates_presence_of :username

  has_many :vinyls

  def assign_admin_default
    user = User.find_by_id(1)
    user.add_role(:admin)
  end

  def assign_default_role
    self.add_role(:collector)
  end
end
