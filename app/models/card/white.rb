class Card::White < Card
  include Card::WhiteAdmin

  default_scope { where card_type: Card::TYPES[:white] }

  TEXT_TYPES = {
    answer: 'answer'
  }

  validates :card_type, inclusion: { in: [ TYPES[:white] ] }
  validates :text_type, inclusion: { in: TEXT_TYPES.values }

  def before_import_save record
    self.card_type = TYPES[:white]
    self.text_type = TEXT_TYPES[:answer]
    self.stack = Stack.where(name: "Cards Against Humanity").first
  end

  def text_type_enum
    TEXT_TYPES.values
  end
end
