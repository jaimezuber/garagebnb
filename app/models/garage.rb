class Garage < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
