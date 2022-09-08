class ServiceTicket < ApplicationRecord
  belongs_to :user
  belongs_to :driver_service
end
