class CreateHouseholdAppliances < ActiveRecord::Migration[5.1]
  def change
    create_table :household_appliances do |t|
      t.string :name
      t.float :electricity_use
      t.belongs_to :outlet, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
