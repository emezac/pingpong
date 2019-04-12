class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.references :player, foreign_key: true
      t.string :oponent
      t.integer :status
      t.float :award
      t.string :name
      t.text :chronic
      t.text :score

      t.timestamps
    end
  end
end
