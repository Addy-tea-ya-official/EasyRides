class Vehicle < ApplicationRecord
  has_one :driver_service
  belongs_to :user
end
