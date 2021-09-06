class ProjectAllphasesController < ApplicationController
    before_action :all_projects
    before_action :find_project
    before_action :all_phases
    before_action :get_user
    

    def index
        @all_phases = @userproject.phases
        @userproject
        @implementer_id = @ticket_implementer['id']
        @ifirst_name = @ticket_implementer['first_name']
        @ilast_name = @ticket_implementer['last_name']
    end

    private

    def all_projects
        @allprojects = Project.all
    end 

    def find_project
        @userproject = Project.find(params[:project_id])
    end

    def all_phases
        @all_phases = @userproject.phases
    end

    def all_users
        @implementers = User.all
    end

    def get_user     
        # @implementer = User.find(params[:id])
        @user_id = @userproject.user_id
        @implementer = User.find(@user_id)
        @ticket_implementer = User.find_by(id: @user_id)
        
    end

    # def find_user_phase
    #     @userphase = @userproject.phases.find(params[:id])
    # end

end
