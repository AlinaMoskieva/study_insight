class Discipline < ApplicationRecord
  validates :name, presence: true

  belongs_to :curriculum
  has_one :discipline_program, dependent: :destroy
  
  has_many :custom_attributes, as: :customizable, inverse_of: :customizable, dependent: :destroy
  has_many :custom_sections, as: :targetable, inverse_of: :targetable, dependent: :destroy
  
  accepts_nested_attributes_for :custom_sections, allow_destroy: true
  accepts_nested_attributes_for :custom_attributes, allow_destroy: true
end
