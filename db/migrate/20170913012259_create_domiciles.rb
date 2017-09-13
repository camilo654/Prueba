class CreateDomiciles < ActiveRecord::Migration[5.1]
  def change
    create_table :domiciles do |t|
      t.string :address
      t.string :city
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
