class DisciplineProgramsComparator < BaseComparator
  include Interactor

  delegate :target, :compare_with, to: :context
  delegate :discipline_program, to: :target, prefix: true
  delegate :discipline_program, to: :compare_with, prefix: true

  def call
    comparation_result = OpenStruct.new
    comparation_result.target = target_discipline_program
    comparation_result.compare_with = compare_with_discipline_program
    
    if target_discipline_program && compare_with_discipline_program
      comparation_result.description_compare = description_compare
      comparation_result.associations_compare = associations_compare
    end

    comparation_result
  end

  private

  def description_compare
    return unless target_discipline_program.description && compare_with_discipline_program.description

    OpenStruct.new({
      similar_percentage: texts_similar_percentage(target_discipline_program.description, compare_with_discipline_program.description),
      diff: diff(target_discipline_program.description, compare_with_discipline_program.description)
    })
  end

  def associations_compare
    OpenStruct.new({
      custom_sections: CustomSectionsComparator.new(target: target_discipline_program, compare_with: compare_with_discipline_program).call,
      custom_attributes: CustomAttributesComparator.new(target: target_discipline_program, compare_with: compare_with_discipline_program).call
    })
  end
end