class Answers::LikesController < ApplicationController
  include AnswerScoped

  def create
    @answer.liked_by user: Current.user

    respond_to do |format|
      format.js { render "answers/likes/refresh" }
    end
  end

  def destroy
    @answer.unliked_by user: Current.user

    respond_to do |format|
      format.js { render "answers/likes/refresh" }
    end
  end
end
