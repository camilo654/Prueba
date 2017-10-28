class CreateHouseholdAppliances < ActiveRecord::Migration[5.1]
  def change
    create_table :household_appliances do |t|
      t.string :name
      t.float :electricity_use
      t.references :outlet, unique: true, foreign_key: true, optional: true
      t.references :category, foreign_key: true, optional: true
      t.belongs_to :user, index: true, foreign_key: true


      t.timestamps
    end
  end
end
