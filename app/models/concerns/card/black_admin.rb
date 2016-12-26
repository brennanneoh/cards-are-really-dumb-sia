module Card::BlackAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      label 'Black Cards'

      import do
        exclude_fields :type, :blanks, :stack
      end

      edit do
        configure :text_type do
          default_value Card::Black::TEXT_TYPES[:question]
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
