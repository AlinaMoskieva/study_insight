class EducationalInstitution < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :training_directions, dependent: :destroy
end
