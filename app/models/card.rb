class Card < ApplicationRecord
  include CardAdmin

  TYPES = {
    black: 'black',
    white: 'white'
  }

  TEXT_TYPES = {
    question: 'question',
    fill_in_the_blanks: 'fill_in_the_blanks',
    answer: 'answer'
  }

  belongs_to :stack

  validates :stack, presence: true
  validates :text, presence: true, uniqueness: true
  validates :type, inclusion: { in: TYPES.values }
  validates :text_type, inclusion: { in: TEXT_TYPES.values }

  private

  def type_enum
    TYPES.values
  end

  def text_type_enum
    TEXT_TYPES.values
  end
end
