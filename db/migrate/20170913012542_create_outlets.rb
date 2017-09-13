class CreateOutlets < ActiveRecord::Migration[5.1]
  def change
    create_table :outlets do |t|
      t.boolean :estate
      t.belongs_to :room, index: true, foreign_key: true

      t.timestamps
    end
  end
end
