class QuestionsController < ApplicationController
    before_action :find_survey, only: [:new, :create, :subjective]
    
    def index
        @new = params[:survey_id]
        redirect_to new_survey_question_path()
    end

    def create
        @count = params[:question_cnt].to_i ## integer로 변환
        
        for i in 1..@count
            @question = "question"+i.to_s
            #@survey = Question.create(survey_id: params[:survey_id], question_content: params[@question], order: i)
            Question.create(survey_id: params[:survey_id], question_content: params[@question], order: i)
            
            total_count = Survey.find_by(id: params[:survey_id])
            total_count.update(total_count: params[:total_count])
        end
        redirect_to "/"
    end

    private
    def find_survey
      @survey = Survey.find(params[:survey_id])
    end
end
