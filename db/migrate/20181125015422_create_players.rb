class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :city
      t.integer :postal_code

      t.timestamps
    end
  end
end
