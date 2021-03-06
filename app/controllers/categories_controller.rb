class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to "users"
  end
  def new
    @category = Category.new
  end
  def create
    @category =Category.new(category_params)
    if @category.save
      if session[:date_create].empty?
        redirect_to "/users/#{current_user[:id]}"
      else
        @category.update_attributes(updated_at: session[:date_create])
        redirect_to "/users/#{current_user[:id]}"
      end
    else
      render 'new'
    end
  end
  def get_category_date
    session[:date_create] = params[:create_date]
  end
  def income
    if Category.count == 0
      redirect_to '/categories/new'
    else
    @category = User.find(current_user.id).category
    @k = 0
    end
  end
  def expense
    if Category.count == 0
      redirect_to '/categories/new'
    else
    @category = User.find(current_user.id).category
    end
  end
  def destroy
    Category.find(params[:id]).destroy
      redirect_to "/users/#{current_user[:id]}"
  end
  def edit
    @category= Category.find(params[:id])
    render 'edit'
  end
  def update
    @category= Category.find(params[:id])
    @category.update_attributes(update_params)
    redirect_to "/users/#{current_user[:id]}"
  end
  private
  def category_params
    params.require(:category).permit(:name, :cat_type, :summ).merge(user_id: current_user.id)
  end
  def update_params
    params.require(:category).permit(:name, :summ)
  end
end
