class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category

    before_action :is_current_user, only: [:show, :edit, :update, :destroy]

    def index
        @projects = @category.projects
    end

    def new
        @project = @category.projects.build
    end

    def show
    end

    def create
        @project = @category.projects.build(project_params)
        if @project.save
            redirect_to category_projects_path, notice: "Project was successfully created." 
        else
            render :new
        end
    end
    
    def edit
    end

    private
    def get_category
        @category = current_user.categories.find(params[:category_id])
        # redirect_to categories_path, notice: "Not allowed to do that" if @category.nil?
    end

    def is_current_user
        @project = @category.projects.find(params[:id])
        # redirect_to categories_path, notice: "Not allowed to do that" if @project.nil?
    end

    def project_params
        params.require(:project).permit(:RxC, :classification, :project_type, :state, :workflow_date, :ticket_level, :hours_spent, :days_spent, :notes, :category_id, :user_id)
    end

end
