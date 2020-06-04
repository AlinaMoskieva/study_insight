class Discipline < ApplicationRecord
  validates :name, presence: true

  belongs_to :curriculum
  has_one :discipline_program, dependent: :destroy
end
