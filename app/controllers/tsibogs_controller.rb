class TsibogsController < ApplicationController
  #before_action :authenticate_user!
  before_filter :get_user
  respond_to :json

  def suggest
    @restaurant = Restaurant.near(params[:address], 10).order("RANDOM()").limit(1)
    respond_with @restaurant
  end

  def add_points
    @restaurant = Restaurant.where(id: params[:id]).first
    Point.add_point(@user, @restaurant, params[:point_type])
    @total_points = Point.total_points(@user)
    respond_with @total_points
  end

  def history
    points = @user.points
    hashes = []
    points.each do |p|
      hashes << {
        restaurant: p.restaurant_name,
        point_type: p.point_type,
        point: p.point,
        date: p.created_at.strftime("%B %d, %Y")
      }
    end
    respond_with hashes
  end

  private

    def get_user
      @user = User.where(id: params[:user_id]).first
    end

    def report_params
      params.require(:report).permit(:user_id, :description, :photo)
    end
end
