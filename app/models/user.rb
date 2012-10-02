class User < ActiveRecord::Base
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates :email, presence: true

  has_many :created_quotes, class_name: 'Quote', foreign_key: 'creator_id'
end
