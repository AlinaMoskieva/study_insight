class CustomSection < ApplicationRecord
  validates :name, :value, presence: true

  belongs_to :targetable, polymorphic: true
end
