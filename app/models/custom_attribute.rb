class CustomAttribute < ApplicationRecord
  validates :name, :value, presence: true

  belongs_to :customizable, polymorphic: true
end
