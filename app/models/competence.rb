class Competence < ApplicationRecord
  validates :description, :cipher, presence: true

  belongs_to :working_program
end
