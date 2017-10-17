class ProjectsController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @posts = Post.where("project_id = ?", @project.id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project succesfully added!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, alert: "Project successfully deleted!"
  end

private

  def project_params
    project_params = params.require(:project).permit(:name, :short_summary, :summary, :tools, :repo_link, :finished, :image_file_name)
  end

end
