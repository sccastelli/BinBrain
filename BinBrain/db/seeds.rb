# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# seeds.rb

# Limpiar la base de datos antes de ejecutar las semillas

ProductoEscaneado.destroy_all

# Crear productos escaneados ficticios utilizando Faker

50.times do
  tipo = Faker::Commerce.product_name
  empresa = Faker::Company.name
  cantidad = Faker::Number.between(from: 1, to: 100)
  ProductoEscaneado.create(tipo: tipo, empresa: empresa, cantidad: cantidad)
end


