class PagesController < ApplicationController
    def home
        @allprojects = Project.all
        @allphases = Phase.all
    end
end
