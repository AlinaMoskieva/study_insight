class TrainingDirectionDecorator < ApplicationDecorator
  delegate :id, :name
end
