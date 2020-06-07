class CustomSectionsComparator
  include Interactor

  delegate :target, :compare_with, to: :context
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
        similar_percentage: target_section.value.damerau_levenshtein_similar(cw_section.value),
        diff: diff(cw_section.value, target_section.value),
        association_units: CustomUnitsComparator.new(target: target_section, compare_with: cw_section).call,
        association_attributes: CustomAttributesComparator.new(target: target_section, compare_with: cw_section).call
      })
    end
  end

  def diff(string_1, string_2)
     Differ.diff_by_word(string_1, string_2).format_as(:html)
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