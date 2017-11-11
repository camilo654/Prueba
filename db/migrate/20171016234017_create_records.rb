class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.boolean :estate
      #t.datetime :time, :null => false, :default => Time.now
      #t.integer :household_appliances
      t.belongs_to :outlet, index: true, foreign_key: true
      #t.belongs_to :household_appliance, index: true, foreign_key: true

      t.timestamps
    end
  end
end
