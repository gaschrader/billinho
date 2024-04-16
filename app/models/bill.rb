class Bill < ApplicationRecord
  belongs_to :enrollment
  validates :bill_cost,
    presence: true
  validates :due_date,
    presence: true
  validates :status,
    presence: true,
    inclusion: {
      in: ['Aberta', 'Atrasada', 'Paga'],
      message: "%{value} is not a valid status. The valid options are: 'Aberta', 'Atrasada' or 'Paga'."
    }
end
