class Card::Black < Card
  default_scope { where type: Card::TYPES[:black] }

  TEXT_TYPES = {
    question: 'question',
    fill_in_the_blanks: 'fill_in_the_blanks'
  }

  validates :type, inclusion: { in: [ TYPES[:black] ] }
  validates :text_type, inclusion: { in: TEXT_TYPES.values }
end
