class Survey < ApplicationRecord
    has_many :questions, dependent: :destroy
    #  has_many에 :responsers도 추가해야 함
end