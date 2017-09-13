class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :domicile, index: true, foreign_key: true

      t.timestamps
    end
  end
end
