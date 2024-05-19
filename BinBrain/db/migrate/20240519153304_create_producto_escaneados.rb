class CreateProductoEscaneados < ActiveRecord::Migration[7.1]
  def change
    create_table :producto_escaneados do |t|
      t.string :tipo
      t.references :empresa, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
