class DisciplineProgram < ApplicationRecord
  validates :name, :year, :description, presence: true

  belongs_to :discipline
  has_many :custom_sections, as: :targetable, inverse_of: :targetable

  accepts_nested_attributes_for :custom_sections, allow_destroy: true
end
