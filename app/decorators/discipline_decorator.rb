class DisciplineDecorator < ApplicationDecorator
  delegate :id, :name, :description, :course_number, :speciality
  delegate :name, to: :speciality, prefix: true
end
