class PagesController < ApplicationController

    def home
    end

    def index
        @allprojects = Project.all
        @totalprojects = Project.count
    end

    # def query_project
    #     Project.where(params:[:intent])
    # end

    # def query_phases

    # end

    # def query_ticket_level
    # end

    # def query_state
    # end


    
end
