class Institution < ApplicationRecord
  validates :name,
    uniqueness:     true,
    presence:       true
  validates :cnpj,
    uniqueness:     true,
    numericality:   { only_integer: true }
  validates :institution_type,
    inclusion:      { :in => [ 'Universidade', 'Escola', 'Creche'],
    message:        "%{value} is not a valid institution type. The valid options are: 'Universidade', 'Escola' and 'Creche'." }
end
