class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.date :date
      t.float :consumption
      t.belongs_to :household_appliance, index: true, foreign_key: true

      t.timestamps
    end
  end
end
