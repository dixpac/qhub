class AnswersController < ApplicationController
  include QuestionScoped

  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :authorize_managing, only: [:edit, :update, :destroy]

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

  def destroy
    @answer.destroy

    respond_to do |format|
      format.js
    end
  end


  private
    def answer_params
      params.require(:answer).permit(:content)
    end

    def authorize_managing
      raise Guardian::NotAuthorizedError unless Guardian.new(Current.user, @question).can_manage?
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end
end
