# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Populate the Institution table with fake names, cnpjs and a random institution type

possible_institution_types = ['Universidade', 'Escola', 'Creche']

10.times do
  Institution.create(name: Faker::Company.name,
                     cnpj: Faker::Company.brazilian_company_number,
                     institution_type: possible_institution_types.sample)
end
