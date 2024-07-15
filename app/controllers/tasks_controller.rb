class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: TaskBlueprint.render_as_json(@tasks)
  end

  # GET /tasks/1
  def show
    render json: TaskBlueprint.render_as_json(@task)
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: TaskBlueprint.render_as_json(@task), status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: TaskBlueprint.render_as_json(@task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :description, :status, :project_id)
  end
end
