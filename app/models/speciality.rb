class Speciality < ApplicationRecord
  validates :name, presence: true

  belongs_to :educational_institution
end
