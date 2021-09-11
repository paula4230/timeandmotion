class Phase < ApplicationRecord

    belongs_to :user
    # belongs_to :category
    belongs_to :project

    validates :step, presence: true

end
