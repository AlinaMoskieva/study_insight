class CustomUnitsComparator
  include Interactor

  delegate :target, :compare_with, to: :context
  delegate :custom_section_units, to: :target, prefix: true
  delegate :custom_section_units, to: :compare_with, prefix: true

  def call
    comparation_result = OpenStruct.new
    comparation_result.missed_in_compare_with = missed_section_units_in_compare_with
    comparation_result.missed_in_target = missed_section_units_in_target
    comparation_result.similar = similar_percentage
    comparation_result
  end

  private

  def similar_percentage
    common_section_units.map do |target_unit|
      cw_section_unit = compare_with_custom_section_units.find_by(name: target_unit.name)

      OpenStruct.new({
        name: target_unit.name,
        target: target_unit,
        comare_with: cw_section_unit,
        similar_percentage: target_unit.value.damerau_levenshtein_similar(cw_section_unit.value),
        diff: diff(cw_section_unit.value, target_unit.value),
        association_attributes: CustomAttributesComparator.new(target: target_unit, compare_with: cw_section_unit).call
      })
    end
  end

  def diff(string_1, string_2)
     Differ.diff_by_word(string_1, string_2).format_as(:html)
  end

  def missed_section_units_in_compare_with
    missed_names = target_custom_section_unit_names - compare_with_custom_section_unit_names
    return [] if missed_names.empty?
    
    target_custom_section_units.where(name: missed_names)
  end

  def missed_section_units_in_target
    missed_names = compare_with_custom_section_unit_names - target_custom_section_unit_names
    return [] if missed_names.empty?
    
    compare_with_custom_section_units.where(name: missed_names)
  end

  def target_custom_section_unit_names
    @_target_custom_section_units ||= target_custom_section_units.pluck(:name)
  end

  def compare_with_custom_section_unit_names
    @_compare_with_custom_section_units ||= compare_with_custom_section_units.pluck(:name)
  end

  def common_section_units
    @_common_section_units = target.custom_section_units.where(name: compare_with_custom_section_unit_names)
  end
end