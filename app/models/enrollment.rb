class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :bill

  validates :total_cost,
    presence: true,
    numericality: {
      greather_than: 0                    # posso colocar mensagem
    }
  validates :number_of_bills,
    presence: true,
    numericality: {
      greather_than_or_equal_to: 1        # posso colocar mensagem
    }
  validates :bill_due_date,
    presence: true,
    numericality: {
      greather_than_or_equal_to: 1,
      less_than_or_equal_to: 31           # posso colocar mensagem
    }
  validates :course_name,
    presence: true
  validate :institution_id_exists
  validate :student_id_exists

  def institution_id_exists
    return false if Institution.find_by_id(self.institution_id).nil?
  end

  def student_id_exists
    return false if Student.find_by_id(self.student_id).nil?
  end
end
