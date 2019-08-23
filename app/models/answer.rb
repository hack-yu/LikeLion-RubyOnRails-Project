class Answer < ApplicationRecord
    has_many :responsers, dependent: :destroy
    belongs_to :question
end
