class AnswersController < ApplicationController
  include QuestionScoped

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

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
