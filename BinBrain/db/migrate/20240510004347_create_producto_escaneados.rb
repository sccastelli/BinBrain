class CreateProductoEscaneados < ActiveRecord::Migration[7.1]
  def change
    create_table :producto_escaneados do |t|
      t.string :tipo
      t.string :empresa
      t.integer :cantidad

      t.timestamps
    end
  end
end
