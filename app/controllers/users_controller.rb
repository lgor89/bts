class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @category = @user.category
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end

  end
  def update
    @user = User.find(params[:id])
    @name=params[:user][:name]
    @category = @user.category
    @from = params[:user][:date_from]
    unless @from == nil
    @to = params[:user][:date_to]
    @date_array = []
    binding.pry
    @category.each do |i|
     if @from<= i.created_at.to_date.to_s
     begin
     @date_array << i
     end while i.created_at.to_date.to_s > @to
     end
    end
    @date_array
    end
    render 'search'
  end
private
def search_params
    params.require(:user).permit(:name)
end
end
