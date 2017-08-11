class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
    @category = @user.category.order("updated_at asc")
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end

  end
  def update
    @user = User.find(params[:id])
    @category = @user.category.order("updated_at asc")
    if params.include?("user")
    @name=params[:user][:cat_name]
    else
      @from = User.find(current_user.id).date_from
      unless @from == nil
        @to = User.find(current_user.id).date_to
        @date_array = []
        @category.each do |i|
          if @from<= i.updated_at.to_date.to_s
            unless i.updated_at.to_date.to_s > @to
              @date_array << i
            end
          end
        end
        @date_array
      end
    end
    render 'search'
  end
  def get_date
    if params.include?("date_from")
      @date_from = params[:date_from]
      User.find(current_user.id).update_attributes(date_from: @date_from.to_date.to_s)
    elsif params.include?("date_to")
      @date_to = params[:date_to]
      User.find(current_user.id).update_attributes(date_to: @date_to.to_date.to_s)
      update
    end
  end
private
def search_params
    params.require(:user).permit(:name)
end
end
