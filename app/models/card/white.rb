class Card::White < Card
  default_scope { where type: Card::TYPES[:white] }

  TEXT_TYPES = {
    answer: 'answer'
  }

  validates :type, inclusion: { in: [ TYPES[:white] ] }
  validates :text_type, inclusion: { in: TEXT_TYPES.values }
end
