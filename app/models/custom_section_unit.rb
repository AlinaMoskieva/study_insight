class CustomSectionUnit < ApplicationRecord
  validates :name, :value, presence: true

  belongs_to :custom_section
  has_many :custom_attributes, as: :customizable, inverse_of: :customizable, dependent: :destroy

  accepts_nested_attributes_for :custom_attributes, allow_destroy: true
end
