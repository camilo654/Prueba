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

    #Se devuelve el consumo
    render :soap => consumption
  end

  # check case
  # soap_action "check",
  #             :args   => { :email => :string},
  #             :return => :boolean
  # def check
  #   user = User.by_email(params[:email])
  #   validate = true
  #   if !(user)
  #     validate = false 
  #   end
  #   render :soap => validate
  # end
end