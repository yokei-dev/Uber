class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, length: { maximum: 50 }
  has_many :delivery_requests
  has_many :relationships
  has_many :driver_people, through: :relationships, source: :driver
  has_many :accounts
end
