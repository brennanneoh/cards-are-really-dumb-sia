class Card::Black < Card
  include Card::BlackAdmin

  default_scope { where card_type: TYPES[:black] }

  TEXT_TYPES = {
    question: 'question',
    fill_in_the_blanks: 'fill_in_the_blanks'
  }

  validates :card_type, presence: true, inclusion: { in: [ Card::TYPES[:black] ] }
  validates :text_type, presence: true, inclusion: { in: TEXT_TYPES.values }
  validates :blanks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, if: :is_fill_in_the_blanks?

  def text_type_enum
    TEXT_TYPES.values
  end

  def before_import_save record
    self.card_type = TYPES[:black]
    self.text_type = TEXT_TYPES[:fill_in_the_blanks] unless record[:text_type].present?
    self.stack = Stack.where(name: "Cards Against Humanity").first
    self.count_and_record_blanks
  end

  def count_and_record_blanks
    if self.text_type == TEXT_TYPES[:fill_in_the_blanks]
      self.blanks = self.text.count '_'
    else
      self.blanks = 0
    end
  end

  private

  def is_fill_in_the_blanks?
    self.text_type == TEXT_TYPES[:fill_in_the_blanks]
  end
end
