class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: %i[ show edit update destroy ]
    before_action :is_current_user, only: %i[ show edit update destroy ]

    def index
        @categories = current_user.categories
    end

    def new
        @category = current_user.categories.build
    end 

    def create
        @category = current_user.categories.build(category_params)
      
    
        if @category.save
          redirect_to root_path, notice: "Category was successfully created." 
        else
          render :new, status: :unprocessable_entity 
        end
    end 
    
    private
    def set_category
        @category = current_user.categories.find(params[:id])
    end
  
    def category_params
        params.require(:category).permit(:intent, :status, :due, :user_id)
    end

    def is_current_user
        @category = current_user.categories.find_by(id: params[:id])
        redirect_to categories_path, notice: "Not allowed to do that" if @category.nil?
    end

end
