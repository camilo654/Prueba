class WselectroController < ApplicationController
  soap_service namespace: 'urn:WashOutElectro', camelize_wsdl: :lower
  # make case
  soap_action "consumption",
              :args   => { :email => :string},
              :return => :float
  def consumption

    # puts params[:email]
    user = User.by_email(params[:email])
    consumption = -1.0
    if user
      consumption = 0.0
      consumption = user.total_consumption(user.id)
      #user.household_appliances.each do |ha|
      #  consumption = consumption + ha.consumption
      #  puts "lt.consumption = ", ha.consumption
      #end
    end


    # puts consumption
    # render :soap => consumption

    #A la variable consumo se le agigna el valor que devuelva el método 
    #current_consumption definido en el controlador
    # consumo = HouseholdAppliance.current_consumption(user_id: params[:user_id])
    # puts consumo
    #En caso de que no se pueda llamar la función del controlador
    #Toca crear un método en el modelo que devuelva un valor x
    #   consumo = HouseholdAppliance.consumoDummy(user_id: params[:user_id]) 

    #Prueba de WS
    #consumo = 3.0

    #Se devuelve el consumo
    render :soap => consumption
  end

  # check case
  soap_action "check",
              :args   => { :email => :string},
              :return => :boolean
  def check
    user = User.by_email(params[:email])
    validate = true
    if !(user)
      validate = false 
    end
    render :soap => validate
  end
end