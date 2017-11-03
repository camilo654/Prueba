class WselectroController < ApplicationController
  soap_service namespace: 'urn:WashOutElectro', camelize_wsdl: :lower
  # make case
  soap_action "make",
              :args   => { :user_id => :integer},
              :return => :float
  def make
    #A la variable consumo se le agigna el valor que devuelva el método 
    #current_consumption definido en el controlador
    #consumo = HouseholdAppliance.current_consumption(user_id: params[:user_id])
    
    #En caso de que no se pueda llamar la función del controlador
    #Toca crear un método en el modelo que devuelva un valor x
    #   consumo = HouseholdAppliance.consumoDummy(user_id: params[:user_id]) 

    #Prueba de WS
    consumo = 3.0

    #Se devuelve el consumo
    render :soap => consumo
  end

  # check case
  soap_action "check",
              :args   => { :start => :integer, :end => :integer, :amount => :double},
              :return => :boolean
  def check
    amount = params[:amount]
    validate = true
    if !(Account.exists?(id: params[:start]))
      validate = false
    end
    if !(Account.exists?(id: params[:end]))
      validate = false
    end
    render :soap => validate
  end
end