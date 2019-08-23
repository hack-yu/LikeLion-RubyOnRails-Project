class ResponsersController < ApplicationController
    def index
        # @questions = Question.where(survey_id: params[:survey])
        @survey_title = Survey.find_by(id: params[:survey_id]).title
        # @servey_id = Survey.find_by(id: params[:survey_id]).id
        @survey = Survey.find(params[:survey_id])
        @responser = Responser.new
        # @responser.nickname = params[:nickname]
        # @responser.password = params[:password]
        # @responser.save
        # redirect_to responsers_new_path
        # redirect_to survey_r_q_order_path(:id)

    end
    
    def r_create
        @responser = Responser.new
        @responser.nickname = params[:responser][:nickname]
        @responser.password = params[:responser][:password]
        @responser.survey_id = params[:survey_id]
        @responser.save
        # @survey = Survey.find(params[:survey_id])
        # survey = params[:survey_id]
        redirect_to r_q_order_path(params[:survey_id], 1)
    end
    
    def new
        @number = @number + 1
        @question = Question.find_by(id: @number)
        # id가 아니라 해당 survey의 order가 1인걸로 바꿔줘야함
        @number_plus = @number + 1
        @question_plus = Question.find_by(id: @number_plus)
        redirect_to responsers_new_path (@number)
    end
    
    def question
        @answer = Answer.new
        @question = Question.find_by(survey_id: params[:survey_id], order: params[:order])
                
        if Question.find_by(survey_id: @question.survey_id, order: @question.order + 1).nil?
            @is_last_order = true
        else
            @is_last_order = false
        end
    end
    
    # def answer
    #     @answer = Answer.create(
    #         question_id: params[:id], 
    #         content: params[:answer][:content])
    #     @question = @answer.question
    #     redirect_to r_q_order_path(@question.survey_id, @question.order + 1)

    # end
    
    def answer
        @answer = Answer.create(
            question_id: params[:id], 
            content: params[:answer][:content])
        @question = @answer.question
        @a = Question.find_by(survey_id: params[:id]).survey_id
        redirect_to r_q_order_path(@question.survey_id, @question.order + 1)

    end
    
    def thanks
        @answer = Answer.create(
            question_id: params[:id], 
            content: params[:answer][:content])
        

    end
end
