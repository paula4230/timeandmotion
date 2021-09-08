class StepsController < ApplicationController
    before_action :get_category

    def index
        @steps = @category.steps
    end

    def new
        @step = @category.steps.build     
    end

    def create
        @step = @category.steps.create(step_params)

        if @step.save
            redirect_to category_steps_path
        end
    end

    private

    def get_category
        @category = Category.find(params[:category_id])
        # redirect_to projects_path, notice: "Not allowed to do that" if @project.nil?
    end

    def step_params
        params.require(:step).permit(:title, :user_id, :category_id)
    end    

    def find_phases

    end

end
