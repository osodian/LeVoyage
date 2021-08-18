class Trip < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
end
