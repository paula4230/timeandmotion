class Project < ApplicationRecord

    # belongs_to :category
    belongs_to :user

    has_many :phases

    validates :RxC, presence: true
    validates :intent, presence: true
end
