class Place < ApplicationRecord
  belongs_to :place_type
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates_presence_of :title, :accomodate_limit, :address, :bed_limit, :bathroom_limit, :room_limit, :price, :description
end
