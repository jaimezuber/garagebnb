class Garage < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings

  has_one_attached :photo
end
