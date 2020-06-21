class PrepareForComparation
  include Interactor

  LETTERS_NUMBERS_PATTERN = /[^\p{L}\s\d]/.freeze
  REPLACEMENTS = { "й" => "и", "ё" => "е" }.freeze

  delegate :string, to: :context

  def call
    without_punctuation = string.downcase.gsub(LETTERS_NUMBERS_PATTERN, "").squish
    without_stop_words = (without_punctuation.split(" ") - StopWord::ALL).join(" ")
    without_messed_letters = without_stop_words.gsub(Regexp.union(REPLACEMENTS.keys), REPLACEMENTS)
    without_messed_letters
  end
end