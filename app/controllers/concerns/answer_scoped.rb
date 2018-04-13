module AnswerScoped
  extend ActiveSupport::Concern
  include QuestionScoped

  included do
    before_action :set_answer
  end

  private
    def set_answer
      @answer = @question.answers.find(params[:answer_id])
    end
end
