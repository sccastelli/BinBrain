class Empresa < ActiveRecord::Migration[7.1]
  def change
    create_table :empresa do |t|
      t.string :name
      t.integer :cantidad_desechos



      t.timestamps
    end
  end
end
