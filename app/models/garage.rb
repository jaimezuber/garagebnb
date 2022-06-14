class Garage < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
