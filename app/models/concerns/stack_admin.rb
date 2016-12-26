module StackAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :name
        field :created_at do
          label 'Created'
        end
        field :updated_at do
          label 'Updated'
        end
      end
    end
  end
end
