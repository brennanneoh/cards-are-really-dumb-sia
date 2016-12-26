module Card::WhiteAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      label 'White Cards'

      list do
        field :id
        field :text
        field :text_type
        field :created_at do
          label 'Created'
        end
        field :updated_at do
          label 'Updated'
        end
      end

      import do
        exclude_fields :card_type, :text_type, :blanks, :stack
      end

      edit do
        configure :text_type do
          default_value Card::TEXT_TYPES[:answer]
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
