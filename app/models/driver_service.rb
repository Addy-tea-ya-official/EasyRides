class DriverService < ApplicationRecord
  has_many :service_tickets
  belongs_to :user, optional: true
  belongs_to :vehicle
end
