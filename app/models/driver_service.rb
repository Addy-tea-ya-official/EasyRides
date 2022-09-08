class DriverService < ApplicationRecord
  has_many :service_tickets
  belongs_to :user
  belongs_to :vehicle
end
