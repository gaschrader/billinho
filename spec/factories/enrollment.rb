# possible_number_of_bills = Array (1..12)
# possible_days = Array (1..31)
# possible_courses = [
#   'Ciência da Computação', 'Medicina', 'Odontologia', 'Engenharia Mecânica', 'Engenharia de Materiais',
#   'Análise e Desenvolvimento de Sistemas', 'Educação Física', 'Letras', 'Design Gráfico', 'História'
# ]
#
# FactoryBot.define do
#   factory :enrollment do
#     total_cost { 10000.00 }
#     number_of_bills { possible_number_of_bills.sample }
#     bill_due_date { possible_days.sample }
#     course_name { possible_courses.sample }
#     institution_id { 1 }
#     student_id { 1 }
#   end
# end
