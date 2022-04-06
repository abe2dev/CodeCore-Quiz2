class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy] 

  def create
    idea = Idea.find params[:idea_id]
    like = Like.new( user: current_user, idea: idea )

    if can?(:like, idea)
      if like.save
        redirect_to idea_path(idea), { notice: "Idea Liked", status: 303 }
      else
        redirect_to root_path, { alert: like.errors.full_messages.join(", "), status: 303 }
      end
    else
      redirect_to root_path, { alert: "You can't like your own idea....", status: 303 }
    end
  end

  def destroy
    like = Like.find params[:id]

    if can?(:destroy, like)
      like.destroy
      redirect_to root_path, { notice: "Idea unliked", status: 303 }
    else
      redirect_to root_path, {alert: "You can't unlike because not authorized!", status: 303 }
    end
  end
end