possible_institution_types = ['Universidade', 'Escola', 'Creche']

FactoryBot.define do
  factory :institution do
    name { Faker::Company.name }
    cnpj { Faker::Company.brazilian_company_number }
    institution_type { possible_institution_types.sample }
  end
end
