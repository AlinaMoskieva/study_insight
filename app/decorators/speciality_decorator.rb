class SpecialityDecorator < ApplicationDecorator
  delegate :id, :name
end
