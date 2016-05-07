class Card::Black < Card
  alias_attribute :question, :text
  alias_attribute :fill_in_the_blank, :text
end
