class Outlet < ApplicationRecord
    belongs_to :room
    has_one :household_apliance

    after_save :guardar_registro, on: :update

    private
    	def guardar_registro
    		if self.state?
    			Record.create(household_appliances: 'id_electro', state: true)
    		else
    			Record.create(household_appliances: 'id_electro', state: nil)
    			:calcula_consumo(id_electro)
    		end
    	end

    	def calcula_consumo(id)
    		#Va a la tabla Record y con el id busca el ultimo registro con state = 0 y 
    		#el anterior registro con state = 1
    		#valIni = registro.state1
    		#valFin = registro.state0
    		#Resta entre fechas para obtener tiempo que estuvo encendido y multiplicar por lo que consuma el electro
    		#consumo = (valFin - valIni) * Household_appliance.getElectricity_use(id)
    		Register.create(id: id,date: CURDATE(), consumption: consumo)
    	end

end
