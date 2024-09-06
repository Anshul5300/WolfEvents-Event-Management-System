class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :events, through: :tickets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :default_role

  private
  def default_role
    self.role = "user"
  end
end
