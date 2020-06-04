class DisciplineProgram < ApplicationRecord
  validates :name, :year, :description, presence: true

  belongs_to :discipline
end
