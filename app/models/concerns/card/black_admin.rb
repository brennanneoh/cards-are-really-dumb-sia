module Card::BlackAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      label 'Black Cards'
    end
  end
end
