class Category < ApplicationRecord
    belongs_to :user
    has_many :steps

    validates :intent, presence: true
    validates :intent, uniqueness: true
end
