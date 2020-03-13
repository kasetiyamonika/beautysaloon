class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name, limit: 30
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
