class LikingsController < ApplicationController
  before_action :set_likable

  def create
    @likable.likings.where(user: Current.user).first_or_create

    respond_to do |format|
      format.js { render "likings/refresh" }
    end
  end

  def destroy
    @likable.likings.where(user: Current.user).destroy_all

    respond_to do |format|
      format.js { render "likings/refresh" }
    end
  end

  private
    def set_likable
      @likable = if params[:question_id]
                   Question.find(params[:question_id])
                 elsif params[:answer_id]
                   Answer.find(params[:answer_id])
                 end
    end
end
