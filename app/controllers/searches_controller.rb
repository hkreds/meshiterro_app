class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @post_images = PostImage.looks(params[:search], params[:word]).page(params[:page])
    end
  end

end
