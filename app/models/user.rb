class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  has_many :statuses, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :name, presence: true
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true
  validates :password_confirmation, presence: true

  def authenticate
    password_digest == password
  end
end
