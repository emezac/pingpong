class CreateScoreboards < ActiveRecord::Migration[5.0]
  def change
    create_table :scoreboards do |t|
      t.integer :scoreplayer1
      t.integer :scoreplayer2
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
