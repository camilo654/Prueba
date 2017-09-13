class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizations do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.belongs_to :household_appliance, index: true, foreign_key: true
      t.timestamps
    end
  end
end
