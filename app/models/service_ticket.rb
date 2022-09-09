class ServiceTicket < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :driver_service
end
