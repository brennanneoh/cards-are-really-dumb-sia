class Card::White < Card
  include Card::WhiteAdmin

  default_scope { where type: Card::TYPES[:white] }

  TEXT_TYPES = {
    answer: 'answer'
  }

  validates :type, inclusion: { in: [ TYPES[:white] ] }
  validates :text_type, inclusion: { in: TEXT_TYPES.values }

  def text_type_enum
    TEXT_TYPES.values
  end
end
