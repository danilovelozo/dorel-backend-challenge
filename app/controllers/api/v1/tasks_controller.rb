class Api::V1::TasksController < Api::ApiController
  before_action :authorize_request, except: :create
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    @tasks = current_user.tasks
    render json: TaskSerializer.new(@tasks)
  end

  def show
    render json: TaskSerializer.new(@task)
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      render json: TaskSerializer.new(@task), status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: TaskSerializer.new(@task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :start_date, :end_date, :completed)
  end
end