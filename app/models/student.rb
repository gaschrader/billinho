class Student < ApplicationRecord
  has_many :enrollment
  validates :name,
    uniqueness: true,
    presence: true
  validates :cpf,
    uniqueness: true,
    presence: true,
    numericality: {
      only_integer: true
    }
  validates :gender,
    presence: true,
    inclusion: {
      in: ['M', 'F'],
      message: "%{value} is not a valid gender. The valid options are: 'M' or 'F'."
    }
  validates :payment_method,
    presence: true,
    inclusion: {
      in: ['Boleto', 'Cartão'],
      message: "%{value} is not a valid payment method. The valid options are: 'Boleto' or 'Cartão'."
    }
end
