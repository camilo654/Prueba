class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :telephone
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
