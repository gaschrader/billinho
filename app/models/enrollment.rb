class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :bill
end
