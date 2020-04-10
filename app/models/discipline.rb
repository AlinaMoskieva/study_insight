class Discipline < ApplicationRecord
  validates :name, presence: true

  belongs_to :training_direction

  has_many :working_programs, dependent: :destroy
end
