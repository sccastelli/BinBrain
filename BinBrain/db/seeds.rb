# db/seeds.rb
require 'faker'

# Clear existing data
Empresa.destroy_all
ProductoEscaneado.destroy_all

# Create 10 empresas
10.times do
  empresa = Empresa.create!(
    name: Faker::Company.name,
    cantidad_desechos: Faker::Number.between(from: 1, to: 100)
  )

  # Create 5 producto_escaneados for each empresa
  5.times do
    ProductoEscaneado.create!(
      tipo: Faker::Commerce.product_name,
      empresa: empresa,
      cantidad: Faker::Number.between(from: 1, to: 1000)
    )
  end
end

puts "Seeding complete!"


