class Room < ApplicationRecord
  belongs_to :user

  validates :home_type, presence: true
  validates :accomodate, presence: true
  validates :bed_room, presence: true
  validates :bed_room, presence: true
  validates :listing_name, presence: true, length:{maximum: 75}
  validates :summary, presence: true, length:{maximum: 600}

end
