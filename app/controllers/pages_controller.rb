class PagesController < ApplicationController

    def home
        @allprojects = Project.all
        @intent = Project.where(intent: 'PMTA Enhancement')
        @allphases = Phase.all
    end

    def index
        @allprojects = Project.all
        @totalprojects = Project.count
    end

    def query_project
        @intent = Project.where(intent: params[:intent]).group(:classification).average(:hours_spent)

        if @intent
            render :home
        end  
    end

    def query_phase
        byebug
        @projects = Project.where(intent: params[:intent])

        @projects.each do |p|
            @phase_list = Phase.where(project_id: p.id).group(:step).average(:durationinmin)
        end


        if @projects
            render :home
        end 
    end

    # def query_ticket_level
    # end

    # def query_state
    # end

    # private 
    # def project_params
    #     params.require(:project).permit(:RxC, :classification, :project_type, :state, :workflow_date, :ticket_level, :hours_spent, :days_spent, :notes, :intent, :category_id, :user_id)
    # end

    
end
