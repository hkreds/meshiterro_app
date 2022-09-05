class RelationshipsController < ApplicationController
  # フォローするとき
  def create
    @users = User.all
    current_user.follow(params[:user_id])
  end
  # フォロー外すとき
  def destroy
    @users = User.all
    current_user.unfollow(params[:user_id])
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
