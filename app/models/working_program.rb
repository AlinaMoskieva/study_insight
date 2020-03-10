class WorkingProgram < ApplicationRecord
  validates :start_at,
    :developed_at,
    :developed_in,
    :language,
    :adapt_to_needs_of_disabilities,
    presence: true

  belongs_to :discipline
end