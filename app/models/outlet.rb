class Outlet < ApplicationRecord
    belongs_to :room
    has_one :household_appliance
    has_many :records, dependent: :destroy

    #after_save :guardar_registro, on: :update

    #def self.by_light( light_id )
     #   load.where( {light_id: light_id} )
    #end

 #   def lights
  #      @lights = Array.new
   #     self.places.each do |pl|
    #        pl.lights.each do |li|
     #           @lights.push( li.id )
      #      end
       # end
        #Light.by_ids( @lights )
    #end

    #@phonecalls.each do |ph|
     #  ph.results.each do |r|
      #  = r.id
    #def self.electro
     #   self.household_appliances do |ha|
      #      @household_appliance = ha.id
       # end
    #end

    #@household_appliances = HouseholdAppliance.where("outlet_id = ?", self.id )

    #@household_appliances = HouseholdAppliance.where("outlet_id = ?", params[:outlet_id] )

    #Outlet.household_appliances

    #@household_appliance = self.household_appliance
    #by_id(self.household_appliance_id)
    #@records = Record.by_record(self.by_outlet)

    # private
    # 	def guardar_registro            

    # 		if self.estate?
    # 			Record.create(household_appliances: household_appliance_id, estate: true)
    # 		else
    # 			Record.create(household_appliances: household_appliance_id, estate: false)
    # 			:calcula_consumo
    # 		end
    # 	end

    # 	def calcula_consumo
    #         #Va a la tabla Record y con el id busca el ultimo registro con estate = 0
    #         @valIni = Record.where("household_appliances = ? and estate = ?", household_appliance_id, 0).last;
    #         #Va a la tabla Record y con el id busca el ultimo registro con estate = 1
    #         @valFin = Record.where("household_appliances = ? and estate = ?", household_appliance_id, 1).last;
    #         #Resta entre fechas para obtener tiempo que estuvo encendido y multiplicar por lo que consuma el electro
    # 		@consumo = (valFin - valIni) * @household_appliance.electricity_use;
    #         @time = Time.now
    # 		Register.create(household_appliance_id: household_appliance.id, date: t.strftime("%d/%m/%Y"), consumption: consumo)
    # 	end

end
