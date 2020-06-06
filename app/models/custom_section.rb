class CustomSection < ApplicationRecord
  validates :name, :value, presence: true

  belongs_to :targetable, polymorphic: true
  
  has_many :custom_section_units, inverse_of: :custom_section, dependent: :destroy

  accepts_nested_attributes_for :custom_section_units, allow_destroy: true
end
