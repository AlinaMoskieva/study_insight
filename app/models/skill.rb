class Skill < ApplicationRecord
  validates :name, :level, presence: true

  belongs_to :working_program
end
