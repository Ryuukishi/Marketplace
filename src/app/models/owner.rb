class Owner < ApplicationRecord
  belongs_to :user, optional: true
  has_many :vehicles
end
