module QuestionScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_question
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end
end
