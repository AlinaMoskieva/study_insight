class CustomSectionsComparator < BaseComparator
  include Interactor

  delegate :custom_sections, to: :target, prefix: true
  delegate :custom_sections, to: :compare_with, prefix: true

  def call
    comparation_result = OpenStruct.new
    comparation_result.missed_in_compare_with = missed_sections_in_compare_with
    comparation_result.missed_in_target = missed_sections_in_target
    comparation_result.similar = similar_percentage
    comparation_result
  end

  private

  def missed_sections_in_compare_with
    missed_names = target_custom_sections_names - compare_with_custom_sections_names
    return [] if missed_names.empty?
    
    target_custom_sections.where(name: missed_names)
  end

  def missed_sections_in_target
    missed_names = compare_with_custom_sections_names - target_custom_sections_names
    return [] if missed_names.empty?
    
    compare_with_custom_sections.where(name: missed_names)
  end

  def similar_percentage
    common_sections.map do |target_section|
      cw_section = compare_with_custom_sections.find_by(name: target_section.name)

      OpenStruct.new({
        name: target_section.name,
        target: target_section,
        comare_with: cw_section,
        similar_percentage: texts_similar_percentage(target_section.value, cw_section.value),
        diff: diff(cw_section.value, target_section.value),
        associations: compare_associations(target_section, cw_section)
      })
    end
  end

  def compare_associations(target, cw)
    OpenStruct.new({
      custom_units: CustomUnitsComparator.new(target: target, compare_with: cw).call,
      custom_attributes: CustomAttributesComparator.new(target: target, compare_with: cw).call
    })
  end

  def target_custom_sections_names
    @_target_custom_sections_names ||= target_custom_sections.pluck(:name)
  end

  def compare_with_custom_sections_names
    @_compare_with_custom_sections_names ||= compare_with_custom_sections.pluck(:name)
  end

  def common_sections
    @_common_sections = target_custom_sections.where(name: compare_with_custom_sections_names)
  end
end