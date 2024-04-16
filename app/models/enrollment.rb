class Enrollment < ApplicationRecord
  belongs_to :Institution
  belongs_to :Student
end
