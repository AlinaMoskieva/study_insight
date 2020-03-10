class Discipline < ApplicationRecord
  validates :name, presence: true

  belongs_to :speciality

  has_many :working_programs, dependent: :destroy
end
