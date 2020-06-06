class DisciplineProgram < ApplicationRecord
  validates :name, :year, :description, presence: true

  belongs_to :discipline
  has_many :custom_section, as: :targetable
end
