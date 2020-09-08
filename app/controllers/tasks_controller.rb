class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
      @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    
    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def params_task
    params.require(:task).permit(:content)
  end
end
