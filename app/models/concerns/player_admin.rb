module PlayerAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :name
        field :email
        field :created_at
        field :updated_at
      end

      edit do
        [:reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :scores, :games].each do |field|
          configure field do
            visible false
          end
        end
      end
    end
  end
end
