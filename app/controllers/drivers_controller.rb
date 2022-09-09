class DriversController < ApplicationController
  def index
    user = get_user
    requests = []

    driver_requests = ServiceTicket.where(driver_service_id: DriverService.find(user.id))
    driver_requests.each do |request|
      requests.push(
        {
          passenger_name: User.find(request.passenger_id).name,
          passenger_email: User.find(request.passenger_id).email,
          request_status: request.request_status
        }
      )
    end
    render json: requests 
  end
end
