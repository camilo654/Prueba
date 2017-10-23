class Outlet < ApplicationRecord
    belongs_to :room
    has_one :household_apliance

    after_save :guardar_registro, on: :update

    private
    	def guardar_registro
    		if self.state?
    			Record.create(household_appliances: household_apliance.id, state: true)
    		else
    			Record.create(household_appliances: household_apliance.id, state: nil)
    			:calcula_consumo
    		end
    	end

    	def calcula_consumo
            #Va a la tabla Record y con el id busca el ultimo registro con state = 0
            @valIni = Record.where("household_appliances = ? and state = ?", household_apliance.id, 0).last;
            #Va a la tabla Record y con el id busca el ultimo registro con state = 1
            @valFin = Record.where("household_appliances = ? and state = ?", household_apliance.id, 1).last;
            #Resta entre fechas para obtener tiempo que estuvo encendido y multiplicar por lo que consuma el electro
    		@consumo = (valFin - valIni) * household_apliance.electricity_use;
            @time = Time.now
    		Register.create(household_appliance_id: household_apliance.id, date: t.strftime("%d/%m/%Y"), consumption: consumo)
    	end

end
