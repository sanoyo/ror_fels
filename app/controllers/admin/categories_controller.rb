class Admin::CategoriesController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Successfully added category!"
      redirect_to admin_categories_path
    else
      render 'admin/categories/new'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category deleted :("
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Updated category!"
      redirect_to admin_categories_path
    else
      render 'admin/categories/edit'
    end
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end

    def set_user
      @category = Category.find(params[:id])
    end
end
