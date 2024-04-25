possible_days = Array (1..31)
possible_months = Array (1..12)
possible_years = Array (1900..2007)


FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    cpf { Faker::CPF.numeric }
    birth_date { "#{possible_days.sample}/#{possible_months.sample}/#{possible_years.sample}" }
    phone { "#{Faker::PhoneNumber.phone_number}" }
    gender { possible_gender.sample }
    payment_method { possible_payment_methods.sample }
  end
end
