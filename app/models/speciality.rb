class Speciality < ApplicationRecord
  validates :name, presence: true

  belongs_to :educational_institution

  has_many :disciplines, dependent: :destroy
end
