class Institution < ApplicationRecord
  validates :name, presence: true

  belongs_to :university
  has_many  :departments, dependent: :destroy
end
