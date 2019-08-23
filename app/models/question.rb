class Question < ApplicationRecord
    has_many :multiple_choices, dependent: :destroy
    has_many :answers, dependent: :destroy
    
    ## [강사 Comment] Question 모델 참고를 위해 추가 생성
    ## 해당 설정이 사용되는 예시(questions/preview.html.erb) : <%= @q_preview.survey.title %>
    belongs_to :survey
end