# frozen_string_literal: true

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
    @user = User.find(params[:user_id])
    @task = @user.tasks.create(task_params)

    if @task.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @task = Task.find(params[:id])
    @status = %w[open in_progress done]
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_edit_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end

  def task_edit_params
    params.require(:task).permit(:status)
  end

end
