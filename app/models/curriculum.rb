class Curriculum < ApplicationRecord
  validates :name, :course_number, presence: true

  belongs_to :department
  has_many  :disciplines, dependent: :destroy

  has_many :custom_sections, as: :targetable, inverse_of: :targetable
  has_many :custom_section_units, through: :custom_sections

  has_many :custom_attributes, as: :customizable, inverse_of: :customizable, dependent: :destroy

  accepts_nested_attributes_for :custom_sections, allow_destroy: true
  accepts_nested_attributes_for :custom_attributes, allow_destroy: true
end
