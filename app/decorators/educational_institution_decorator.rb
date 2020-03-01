class EducationalInstitutionDecorator < ApplicationDecorator
  delegate :id, :name
end
