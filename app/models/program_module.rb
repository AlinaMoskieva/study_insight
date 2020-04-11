class ProgramModule < ApplicationRecord
  validates :name, :description, :number, presence: true

  validates :number, uniqueness: { scope: :working_program }

  belongs_to :working_program
end
