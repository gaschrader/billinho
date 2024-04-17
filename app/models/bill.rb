class Bill < ApplicationRecord
  #before_validation :set_defaults
  belongs_to :enrollment
  validates :bill_cost,
    presence: true
  validates :due_date,
    presence: true
  validates :status,
    presence: true,
    inclusion: {
      in: ['Aberta', 'Atrasada', 'Paga'],
      message: "\"%{value}\" is not a valid status. The valid options are: 'Aberta', 'Atrasada' or 'Paga'."
    }
  private

  # def set_defaults
  #   self.status = 'Aberta' if not ['Aberta', 'Atrasada', 'Paga'].include? self.status
  # end
end
