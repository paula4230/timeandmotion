class Project < ApplicationRecord

    belongs_to :category
    belongs_to :user

    has_many :phases
end
