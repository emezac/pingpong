class CreateGameloggings < ActiveRecord::Migration[5.0]
  def change
    create_table :gameloggings do |t|
      t.text :newschronic
      t.datetime :eventime
      t.integer :scorepl1
      t.integer :scoreplayer2
      t.boolean :finalpoints
      t.references :game, foreign_key: true
      t.references :player1, foreign_key: true
      t.references :player2, foreign_key: true

      t.timestamps
    end
    add_foreign_key :gameloggings, :players, colum: :player1_id, primary_key: :id
    add_foreign_key :gameloggings, :players, colum: :player2_id, primary_key: :id
  end
end
