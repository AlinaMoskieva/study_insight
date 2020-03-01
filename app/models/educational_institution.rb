class EducationalInstitution < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :specialities, dependent: :destroy
end
