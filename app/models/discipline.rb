class Discipline < ApplicationRecord
  validates :name, presence: true

  belongs_to :curriculum
  has_one :discipline_program, dependent: :destroy
  
  has_many :custom_attributes, as: :customizable, inverse_of: :customizable, dependent: :destroy
  accepts_nested_attributes_for :custom_attributes, allow_destroy: true
end
