class Curriculum < ApplicationRecord
  validates :name, :course_number, presence: true

  belongs_to :department
  has_many  :disciplines, dependent: :destroy
  has_many :custom_section, as: :targetable
end
