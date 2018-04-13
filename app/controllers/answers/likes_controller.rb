class Answers::LikesController < ApplicationController
  include AnswerScoped

  def create
    @answer.likes.where(creator: Current.user).first_or_create

    respond_to do |format|
      format.js { render "answers/likes/refresh" }
    end
  end

  def destroy
    @answer.likes.where(creator: Current.user).destroy_all

    respond_to do |format|
      format.js { render "answers/likes/refresh" }
    end
  end
end
