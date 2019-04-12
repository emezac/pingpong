class CreateGamerounds < ActiveRecord::Migration[5.0]
  def change
    create_table :gamerounds do |t|
      t.text :round
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
