class RequirementsController < ApplicationController

  before_action :set_project
  before_action :set_requirement, only: [:show,:edit,:update,:destroy]

  def new
    @requirement = @project.requirements.build
  end

  def create
    @requirement = @project.requirements.build(requirement_params)
    if @requirement.save
      flash[:notice] = "Requirement has been created."
      redirect_to [@project, @requirement]
    else
      flash[:alert] = "Requirement has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @requirement.update(requirement_params)
      flash[:notice] = "Requirement has been updated."

      redirect_to [@project,@requirement]
    else

      flash[:alert] = "Requirement has not been updated."

      render action: "edit"

    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def requirement_params
    params.require(:requirement).permit(:office,:title,:requirements)
  end

  def set_requirement
    @requirement = @project.requirements.find(params[:id])
  end

end
