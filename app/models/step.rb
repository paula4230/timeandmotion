class Step < ApplicationRecord
    belongs_to :user
    belongs_to :category
end