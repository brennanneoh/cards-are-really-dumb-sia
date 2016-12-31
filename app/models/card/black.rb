class Card::Black < Card
  include Card::BlackAdmin

  default_scope { where(card_type: TYPES[:black]) }

  CARD_TYPE = Card::TYPES[:black]

  TEXT_TYPES = [
    Card::TEXT_TYPES[:question],
    Card::TEXT_TYPES[:fill_in_the_blanks]
  ]

  validates :card_type, presence: true, inclusion: { in: [ CARD_TYPE ] }
  validates :text_type, presence: true, inclusion: { in: TEXT_TYPES }
  validates :blanks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  before_create :count_and_record_blanks, if: lambda { |card| card.text_type == Card::TEXT_TYPES[:fill_in_the_blanks] }

  def self.pick_one
    order("RANDOM()").limit(1).first
  end

  def text_type_enum
    TEXT_TYPES
  end

  def before_import_save record
    self.card_type = self.CARD_TYPE
    self.text_type = Card::TEXT_TYPES[:fill_in_the_blanks] unless record[:text_type].present?
    self.stack = Stack.where(name: "Cards Against Humanity").first
  end

  private

  def count_and_record_blanks
    self.blanks = self.text.count '_'
  end
end
