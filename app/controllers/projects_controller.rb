class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: %i[ show edit update destroy ]
    # before_action :is_current_user, only: %i[ show edit update destroy ]

    def index
        @projects = current_user.projects
    end

    def new
        @project = current_user.projects.build
    end

    def show
    end

    def create
        @project =  current_user.projects.build(project_params)
        if @project.save
            redirect_to projects_path, notice: "Project was successfully created." 
        else
            render :new, status: :unprocessable_entity 
        end
    end
    
    def edit
    end

    private
    def set_project
        @project = current_user.projects.find(params[:id])
        # redirect_to categories_path, notice: "Not allowed to do that" if @category.nil?
    end

    # def is_current_user
    #     @project = current_user.projects.find_by(params[:id])
    #     # redirect_to categories_path, notice: "Not allowed to do that" if @project.nil?
    # end

    def project_params
        params.require(:project).permit(:RxC, :classification, :project_type, :state, :workflow_date, :ticket_level, :hours_spent, :days_spent, :notes, :intent, :category_id, :user_id)
    end

end
