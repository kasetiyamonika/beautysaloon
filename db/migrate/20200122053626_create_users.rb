class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 100
      t.string :last_name, limit: 100
      t.text :address
      t.string :email
      t.string :mobile, limit: 13

      t.timestamps
    end
  end
end
