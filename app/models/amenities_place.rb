class AmenitiesPlace < ApplicationRecord
  belongs_to :place
  belongs_to :amenitie

  def self.process(place, param)
  	 return true if param.nil?
  	 param.each do |id_amenitie|
  	 	AmenitiesPlace.create place_id: place.id, amenitie_id: id_amenitie
  	 end
  end
end
