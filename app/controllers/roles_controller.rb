class RolesController < ApplicationController
  before_action :set_role, only: %i[show update destroy]

  # GET /roles
  def index
    @roles = Role.all

    render json: RoleBlueprint.render_as_json(@roles)
  end

  # GET /roles/1
  def show
    render json: RoleBlueprint.render_as_json(@role)
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      render json: RoleBlueprint.render_as_json(@role), status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      render json: RoleBlueprint.render_as_json(@role)
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def role_params
    params.require(:role).permit(:role, :user_id, :project_id)
  end
end
