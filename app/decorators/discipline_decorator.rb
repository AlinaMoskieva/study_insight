class DisciplineDecorator < ApplicationDecorator
  delegate :id, :name, :description, :course_number, :training_direction
  delegate :name, to: :training_direction, prefix: true
end
