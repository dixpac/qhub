class AnswersController < ApplicationController
  include QuestionScoped

  before_action :set_answer, only: [:edit, :update]

  def create
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.js
      else
        format.js { render partial: "error", status: :error }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.js
      else
        format.js { render partial: "error", status: :error }
      end
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end
end
