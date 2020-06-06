class CustomSectionUnit < ApplicationRecord
  validates :name, :value, presence: true

  belongs_to :custom_section
end
