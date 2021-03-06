class CustomAttributesComparator < BaseComparator
  include Interactor

  delegate :custom_attributes, to: :target, prefix: true
  delegate :custom_attributes, to: :compare_with, prefix: true

  def call
    comparation_result = OpenStruct.new
    comparation_result.missed_in_compare_with = missed_attributes_in_compare_with
    comparation_result.missed_in_target = missed_attributes_in_target
    comparation_result.similar = similar_percentage
    comparation_result
  end

  private

  def similar_percentage
    common_attributes.map do |target_attr|
      cw_attribute = compare_with_custom_attributes.find_by(name: target_attr.name)

      OpenStruct.new({
        name: target_attr.name,
        target: target_attr,
        comare_with: cw_attribute,
        similar_percentage: texts_similar_percentage(target_attr.value, cw_attribute.value),
        diff: diff(target_attr.value, cw_attribute.value)
      })
    end
  end

  def missed_attributes_in_compare_with
    missed_names = target_custom_attributes_names - compare_with_custom_attributes_names
    return [] if missed_names.empty?
    
    target_custom_attributes.where(name: missed_names)
  end

  def missed_attributes_in_target
    missed_names = compare_with_custom_attributes_names - target_custom_attributes_names
    return [] if missed_names.empty?
    
    compare_with_custom_attributes.where(name: missed_names)
  end

  def target_custom_attributes_names
    @_target_custom_attributes_names ||= target_custom_attributes.pluck(:name)
  end

  def compare_with_custom_attributes_names
    @_compare_with_custom_attributes_names ||= compare_with_custom_attributes.pluck(:name)
  end

  def common_attributes
    @_common_attributes = target_custom_attributes.where(name: compare_with_custom_attributes_names)
  end
end