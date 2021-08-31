class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category

    before_action :is_current_user, only: [:show, :edit, :update, :destroy]

    def index
        @projects = @category.projects
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
