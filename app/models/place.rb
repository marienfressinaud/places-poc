class Place < ApplicationRecord
  validates :name, presence: true

  def map_location
    "#{address_line1},#{address_zip}+#{address_city}"
  end
end
