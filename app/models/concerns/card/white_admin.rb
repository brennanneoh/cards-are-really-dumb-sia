module Card::WhiteAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      label 'White Cards'

      edit do
        configure :text_type do
          default_value Card::White::TEXT_TYPES[:answer]

        end
        configure :blanks do
          visible false
        end

        configure :type do
          visible false
        end
      end
    end
  end
end
