module Card::WhiteAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      label 'White Cards'
    end
  end
end
