class PhasesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_project

    def index
        @phases = @project.phases
    end 

    def new
        @phase = @project.phases.build
    end



    def create
        @phase = @project.phases.build(phase_params)

        if @phase.save
            redirect_to project_phases_path, notice: "Phase was successfully created." 
        else
            render :new
        end
    end

    private

    def get_project
        @project = current_user.projects.find(params[:project_id])
        # redirect_to projects_path, notice: "Not allowed to do that" if @project.nil?
    end

    def is_current_user
        @phase = @project.phases.find(params[:id])
        # redirect_to projects_path, notice: "Not allowed to do that" if @phase.nil?
    end

    # def set_task
    #     @task = @category.tasks.find(params[:id])
    # end

    def phase_params
        params.require(:phase).permit(:step, :start_time, :end_time, :durationinmin, :remarks, :project_id, :user_id)
    end




end
