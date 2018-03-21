class QuestionsController < ApplicationController
  before_action :find_survey, only: :create

  def new
  end

  def create
    @question = Question.new(question_params)
    @question.survey = @survey
    if @question.save
      redirect_to @survey
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_survey
    if Survey.exists?(params[:survey_id])
      @survey = Survey.find(params[:survey_id])
    end
  end
end
