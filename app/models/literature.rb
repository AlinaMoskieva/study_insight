class Literature < ApplicationRecord
  enum resource_type: { required: "required", optional: "optional", web: "web" }

  validates :name, :link, :resource_type, presence: true

  belongs_to :working_program
end
