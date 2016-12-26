module CardAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :blanks do
          visible false
        end
      end
    end
  end
end
