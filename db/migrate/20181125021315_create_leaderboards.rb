class CreateLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_table :leaderboards do |t|
      t.integer :ranking
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
