class Card::Black < Card
  include Card::BlackAdmin

  default_scope { where card_type: TYPES[:black] }

  CARD_TYPE = Card::TYPES[:black]

  CARD_TEXT_TYPES = [
    Card::TEXT_TYPES[:question],
    Card::TEXT_TYPES[:fill_in_the_blanks]
  ]

  validates :card_type, presence: true, inclusion: { in: [ CARD_TYPE ] }
  validates :text_type, presence: true, inclusion: { in: CARD_TEXT_TYPES }
  validates :blanks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, if: :is_fill_in_the_blanks?

  def self.pick_one
    order("RANDOM()").limit(1).first
  end

  def text_type_enum
    CARD_TEXT_TYPES
  end

  def before_import_save record
    self.card_type = self.CARD_TYPE
    self.text_type = Card::TEXT_TYPES[:fill_in_the_blanks] unless record[:text_type].present?
    self.stack = Stack.where(name: "Cards Against Humanity").first
    self.count_and_record_blanks
  end

  def count_and_record_blanks
    self.blanks = if self.text_type == Card::TEXT_TYPES[:fill_in_the_blanks]
      self.text.count '_'
    else
      1
    end
  end

  private

  def is_fill_in_the_blanks?
    self.text_type == Card::TEXT_TYPES[:fill_in_the_blanks]
  end
end
