class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :garages, foreign_key: 'owner_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
