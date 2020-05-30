class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :institution
  has_many  :curriculums, dependent: :destroy
end
