class Card::White < Card
  include Card::WhiteAdmin

  has_many :hands, foreign_key: :white_card_id

  default_scope { where card_type: Card::TYPES[:white] }

  validates :card_type, inclusion: { in: [ Card::TYPES[:white] ] }
  validates :text_type, inclusion: { in: [ Card::TEXT_TYPES[:answer] ] }

  def hands_for round_id
    joins(:hands).where hands: { round_id: round_id, player: current_player }
  end

  def self.pick_random count
    order("RANDOM()").limit(count)
  end

  def self.pick_one
    order("RANDOM()").limit(1).first
  end

  def before_import_save record
    self.card_type = Card::TYPES[:white]
    self.text_type = Card::TEXT_TYPES[:answer]
    self.stack = Stack.where(name: "Cards Against Humanity").first
  end

  def text_type_enum
    [ Card::TEXT_TYPES[:answer] ]
  end
end
