class Curriculum < ApplicationRecord
  validates :name, :course_number, presence: true

  belongs_to :department
  has_many  :disciplines, dependent: :destroy
end
