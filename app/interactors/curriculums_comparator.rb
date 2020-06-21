class CurriculumsComparator < BaseComparator
  include Interactor

  def call
    comparation_result = OpenStruct.new
    comparation_result.target = target
    comparation_result.compare_with = compare_with
    comparation_result.associations = compare_associations
    comparation_result
  end

  private

  def compare_associations
    OpenStruct.new({
      custom_attributes: CustomAttributesComparator.new(target: target, compare_with: compare_with).call,
      custom_sections: CustomSectionsComparator.new(target: target, compare_with: compare_with).call,
      disciplines: DisciplinesComparator.new(target: target, compare_with: compare_with).call
    })
  end
end