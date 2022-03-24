class IdeasController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :get_idea!, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :update, :destroy]
  
      def new
          @idea = Idea.new
      end
  
      def create
          @idea = Idea.new idea_params
          @idea.user = current_user
          if @idea.save
              redirect_to ideas_path(@idea), { status: 303, notice: 'Idea created' }
            else
              flash.alert = @idea.errors.full_messages.join(', ')
              render :new, status: 303
            end
      end
  
      def index
            @ideas = Idea.all.order('updated_at DESC') 
      end
  
      def show
          @review = Review.new 
          @reviews = @idea.reviews.order(created_at: :desc)
          @like = @idea.likes.find_by(user: current_user)
      end
  
      def edit
         
      end
  
      def update
          id = params[:id]
          @idea = Idea.find(id)
          if @idea.update(params.require(:idea).permit(:title, :description))
            redirect_to idea_path(@idea), status: 303
          else
            render :edit, status: 303
          end
      end
  
      def destroy
          id = params[:id]
          @idea = Idea.find(id)
          @idea.destroy
          redirect_to ideas_path, status: 303
      end
  
      private
  
      def get_idea!
        @idea = Idea.find(params[:id])
      end 
  
      def authorize! 
        redirect_to root_path, status: 303, alert: 'Not Authorized' unless can?(:crud, @idea)
      end
  end