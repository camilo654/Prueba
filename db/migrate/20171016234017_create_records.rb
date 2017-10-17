class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.datetime :time, :null => false, :default => Time.now
      t.tinyint :household_appliances
      t.boolean :state
      t.belongs_to :outlet, index: true, foreign_key: true

      t.timestamps
    end
  end
end
