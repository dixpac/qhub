class LikesController < ApplicationController
  before_action :set_likable

  def create
    Like.like liker: Current.user, likeable: @likeable
    refresh_likes_section
  end

  def destroy
    Like.unlike liker: Current.user, likeable: @likeable
    refresh_likes_section
  end

  private
    def set_likable
      @likeable ||= GlobalID::Locator.locate_signed params[:sgid]
    end

    def refresh_likes_section
      respond_to do |format|
        format.js { render "likes/refresh", locals: { likeable: @likeable } }
      end
    end
end
