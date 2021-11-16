class Vehicle < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # enum available: { "Yes": true, "No": false }
  
  validates :brand, presence: true
  validates :model, presence: true
  validates :body_type, presence: true
  validates :door_count, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 5 }
  validates :seat_count, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :available, inclusion: [true, false]
  validates :image, presence: true
  
end
