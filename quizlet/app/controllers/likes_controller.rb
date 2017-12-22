class LikesController < ApplicationController
        # before_action: login is here from app controller
  def create
    @like = Like.new(bright_idea_id: params[:id], user_id: session[:user_id])
    if @like.valid?
      @like.save
    else
      flash[:errors] = @like.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    @like = Like.where(bright_idea_id: params[:id], user_id: session[:user_id])
    @like.first.destroy
    redirect_to :back
    end
end
