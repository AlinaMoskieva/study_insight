class DisciplinesComparator
  include Interactor

  delegate :target, :compare_with, to: :context
  delegate :disciplines, to: :target, prefix: true
  delegate :disciplines, to: :compare_with, prefix: true

  def call
    comparation_result = OpenStruct.new
    comparation_result.missed_in_compare_with = missed_disciplines_in_compare_with
    comparation_result.missed_in_target = missed_disciplines_in_target
    comparation_result.similar = similar_percentage
    comparation_result
  end

  private

  def similar_percentage
    common_disciplines.map do |target_record|
      cw_record = compare_with_disciplines.find_by(name: target_record.name)

      OpenStruct.new({
        name: target_record.name,
        target: target_record,
        comare_with: cw_record,
        association_attributes: CustomAttributesComparator.new(target: target_record, compare_with: cw_record).call,
        discipline_programs: {}
      })
    end
  end

  def diff(string_1, string_2)
    Differ.diff_by_word(string_1, string_2).format_as(:html)
  end

  def missed_disciplines_in_compare_with
    missed_names = target_discipline_names - compare_with_discipline_names
    return [] if missed_names.empty?
    
    target_disciplines.where(name: missed_names)
  end

  def missed_disciplines_in_target
    missed_names = compare_with_discipline_names - target_discipline_names
    return [] if missed_names.empty?
    
    compare_with_disciplines.where(name: missed_names)
  end

  def target_discipline_names
    @_target_discipline_names ||= target_disciplines.pluck(:name)
  end

  def compare_with_discipline_names
    @_compare_with_discipline_names ||= compare_with_disciplines.pluck(:name)
  end

  def common_disciplines
    @_common_disciplines = target_disciplines.where(name: compare_with_discipline_names)
  end
end