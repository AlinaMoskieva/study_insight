class CustomSection < ApplicationRecord
  validates :name, :value, presence: true

  belongs_to :targetable, polymorphic: true
  
  has_many :custom_section_units, inverse_of: :custom_section, dependent: :destroy
  has_many :custom_attributes, as: :customizable, inverse_of: :customizable, dependent: :destroy

  accepts_nested_attributes_for :custom_section_units, allow_destroy: true
  accepts_nested_attributes_for :custom_attributes, allow_destroy: true
end
