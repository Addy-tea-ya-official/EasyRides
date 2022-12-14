class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    services = DriverService.where.not(current_capacity: 0)
    services_list = []
    services.each do |service|
      services_list.push(
        {
          driver: {
            name: User.find(service.driver_id).name
          },
          vehicle: { 
            name: Vehicle.find(service.vehicle_id).name
          },
          destination: service.destination,
          current_capacity: service.current_capacity,
          fair: service.fair
        }
      )
    end 
    render json: services_list
  end

  def show
    user = get_user
    service = DriverService.find(params[:id])
    ticket = ServiceTicket.new(
      {
        driver_service_id: service.id,
        passenger_id: user.id
      }
    )
    if ticket.save
      render json: ticket  
    else
      render status: :unprocessable_entity
    end
  end

  def new
    user = get_user
    render json:{
    driver: {
      name: user.name
    },
    vehicles: Vehicle.select(:id ,:registeration_number).where(user_id: user.id)
    }, status: 200
  end

  def create
    user = get_user
    service = DriverService.new(
      {
        driver_id: user.id,
        vehicle_id: service_params[:vehicle_id],
        destination: service_params[:destination],
        current_capacity: service_params[:current_capacity],
        fair: service_params[:fair],
        boarding_time: service_params[:boarding_time]
      }
    )
    if service.save
      render json: service 
    else
      render status: :unprocessable_entity
    end
  end

  private
    def service_params
      params.require(:service).permit(:vehicle_id, :destination, :current_capacity, :fair, :boarding_time)
    end
end
