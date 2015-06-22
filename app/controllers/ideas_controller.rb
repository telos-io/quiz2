class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    idea_params = params.require(:idea).permit(:title, :body)
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path, notice: "Idea Created"
    else
      render :new, notice: "Idea not created"
    end
  end

  def show
    @comment = Comment.new
    @like = @idea.like_for(current_user)
  end

  def edit
    #@idea = Idea.find params[:id]
  end

  def update
    #@idea = Idea.find params[:id]
    idea_params = params.require(:idea).permit(:title, :body)
    if @idea.update idea_params
      redirect_to idea_path(@idea), notice: "Idea Updated"
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Idea Deleted"
  end

private

  def find_idea
    @idea = Idea.find params[:id]
  end

end
