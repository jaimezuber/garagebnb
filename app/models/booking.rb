class Booking < ApplicationRecord
  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :garage
  has_many :reviews

  scope :confirmed, -> { where(status: "confirmed") }

  def confirmed?
    this.status == 'confirmed'
  end
end
