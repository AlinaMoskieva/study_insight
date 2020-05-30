class University < ApplicationRecord
  validates :name, presence: true

  has_many  :institutions, dependent: :destroy
end
