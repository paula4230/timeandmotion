class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end 

    def create
        @category = Category.create(category_params)
      
        if @category.save
          redirect_to categories_path, notice: "Category was successfully created." 
        else
          render :new, status: :unprocessable_entity 
        end
    end 

    def edit
    end
  
    def update
      if @category.update(category_params)
          redirect_to categories_path, notice: "Task was successfully updated." 
      else
          render :edit
      end
    end
    
    private
    def set_category
        @category = Category.find(params[:id])
    end
  
    def category_params
        params.require(:category).permit(:intent, :status, :due, :user_id)
    end


end
