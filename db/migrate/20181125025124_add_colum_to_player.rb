class AddColumToPlayer < ActiveRecord::Migration[5.0]
  def change
     add_column :players, :street,:string
  end
end
