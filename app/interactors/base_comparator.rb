class BaseComparator
  delegate :target, :compare_with, to: :context

  def diff(target, compare_with)
     Differ.diff_by_word(target, compare_with).format_as(:html)
  end

  def texts_similar_percentage(target, compare_with)
    prepared_target = PrepareForComparation.new(string: target).call
    prepared_compare_with = PrepareForComparation.new(string: compare_with).call
    
    coefficient = prepared_target.damerau_levenshtein_similar(prepared_compare_with)
    (coefficient * 100).round(2).to_s + "%"
  end
end