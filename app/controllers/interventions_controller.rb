class InterventionsController < ApplicationController
  before_action :authenticate_user!

  def new
      @clients = Customer.order(:company_name)
      puts @clients.collect{ |c| c.company_name }

      @employee = Employee.order(:last_name)
      puts @employee.collect{ |e| e.first_name + e.last_name }
  end

  def show
  
  end
  
  def get_building
      id_client = params[:id]
      @buildings = Building.where(customer_id: id_client)
      arr = []
      @buildings.each do |building|
        @address = Address.find_by_id(building.address_id)
         arr << @address.city
      end
      render json: { buildings: @buildings, address: arr }
  end    
  
  def get_battery
    id_building = params[:id]
    @batteries = Battery.where(building_id: id_building)
      render json: @batteries
  end

  def get_column
      @columns = Column.where(battery_id: params[:battery_id])
      render json: @columns
  end

  def get_elevator
      @elevators = Elevator.where(column_id: params[:column_id])
      render json: @elevators
  end 


  def create_intervention
    @intervention = Intervention.new(intervention_params)
      params["intervention"].delete("column_id") if params["intervention"]["column_id"] == nil
      params["intervention"].delete("elevator_id") if params["intervention"]["elevator_id"] == nil
      attributes = params[:intervention].permit!
      puts "Hello"
      employee = current_user.employee_id
      
      attributes[:author_id] = current_user.employee_id
      
      intervention = Intervention.new(attributes)
      intervention.save!

    #   intervention_ticket(intervention)
  end 

  def intervention_ticket(intervention)

      comment = { :value => "Intervention ticket author: #{current_user.first_name} #{current_user.last_name}
      \n \n Client: #{intervention.customer.company_name} 
      \n \n Building #: #{intervention.building.id}   (#{intervention.building.company_name})
      \n \n Battery #: #{intervention.battery.id} 
      \n \n Column #: #{intervention.column ? intervention.column.id : "N/Ap"} 
      \n \n Elevator shaft #: #{intervention.elevator ? intervention.elevator.id : "N/Ap"} 
      \n \n Intervention assigned to: #{intervention.employee ? intervention.employee.first_name : "None"} #{intervention.employee ? intervention.employee.last_name : ""} 
      \n \n Intervention description: \n #{intervention.report} "}

      ticket = ZendeskAPI::Ticket.new($client, :type => "support", :priority => "urgent",
      :subject => "Intervention ticket for the #{intervention.customer.company_name} building",
      :comment => comment
      )

      ticket.save!
  end
  private
  def intervention_params
    #params.require(name model)
    params.require(:intervention).permit(:author_id,:customer_id,:building_id,:battery_id,:column_id,:elevator_id,:employee_id,:interventionStartTime,:interventionEndTime,:result,:report)
  end
end