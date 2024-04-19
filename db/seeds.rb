# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

number_of_samples = 10

Faker::Config.locale = 'pt-BR'

# Populate the Institution table with fake names, cnpjs and a random institution type

possible_institution_types = ['Universidade', 'Escola', 'Creche']

number_of_samples.times do
  Institution.create(
    name: Faker::Company.name,
    cnpj: Faker::Company.brazilian_company_number,
    institution_type: possible_institution_types.sample
  )
end

# Populate the Student table with fake data

possible_days = Array (1..31)
possible_months = Array (1..12)
possible_years = Array (1900..2007)

possible_gender = ['M', 'F']

possible_payment_methods = ['Boleto', 'Cartão']

number_of_samples.times do
  Student.create(
    name: Faker::Name.name,
    cpf: Faker::CPF.numeric,
    birth_date: "#{possible_days.sample}/#{possible_months.sample}/#{possible_years.sample}",
    phone: "#{Faker::PhoneNumber.phone_number}",
    gender: possible_gender.sample,
    payment_method: possible_payment_methods.sample
  )
end

possible_number_of_bills = Array (1..12)
possible_courses = [
  'Ciência da Computação', 'Medicina', 'Odontologia', 'Engenharia Mecânica', 'Engenharia de Materiais',
  'Análise e Desenvolvimento de Sistemas', 'Educação Física', 'Letras', 'Design Gráfico', 'História'
]

# possible_ids = Array (1..10)
#
# number_of_samples.times do
#   Enrollment.create(
#     total_cost: Faker::Number.between(from: 0.0, to: 100000.0).round(2),
#     number_of_bills: possible_number_of_bills.sample,
#     bill_due_date: possible_days.sample,
#     course_name: possible_courses.sample,
#     institution_id: possible_ids.sample,
#     student_id: possible_ids.sample
#   )
# end
