class PhasesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_project
    before_action :is_current_user, only: %i[ update_start update_end ]


    def index
        @phases = @project.phases
        @sum = @phases.group(:project_id).sum(:durationinmin)
        @final = @sum.values
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

    def update_start
        # @phase.update(phase_params)
        if @phase.start_time == nil     
            if @phase.update(start_time: Time.current.ceil(2))
                redirect_to project_phases_path
            end
        elsif @phase.start_time != nil
            update_end
        end
    end 

    def update_end
        # @phase.update(phase_params)
        if @phase.start_time == nil 
            update_start
        elsif @phase.start_time != nil    
            if @phase.update(end_time: Time.current.ceil(2))
                
                @durationinmin = ((@phase.start_time - @phase.end_time)*(-1))/60

                @phase.update(durationinmin: @durationinmin)

                redirect_to project_phases_path
            end
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
