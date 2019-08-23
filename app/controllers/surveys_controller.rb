class SurveysController < ApplicationController
  before_action :find_survey_id, only: [:show, :destroy, :preview, :result]
    
  def index
    @surveys = Survey.where(user_id: User.find_by(email: current_user.email)) 
    #자신의 계정에만 해당하는 설문 리스트 출력
  end
  
  def new
    
  end
  
  def create
    @survey = Survey.create(
      title: "#{params[:survey][:title]}",
      user_id: User.find_by(email: current_user.email).id
    )
    #현재 계정의 user_id 값을 넣음 question을 추가 안해도 설문이 바로 생성되는 부분 수정필요로 보임
    redirect_to survey_questions_path(@survey)
  end
  
  def show
    @questions = @survey.questions
  end
  
  def result
    @questions = @survey.questions
  end
  
  def destroy
    @survey.delete
    redirect_to '/'
  end
  
  def preview
    
  end
  
  def link
  
  end
  
  private
  def find_survey_id
    @survey = Survey.find(params[:id])
  end
end
