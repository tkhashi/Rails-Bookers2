class RelationshipsController < ApplicationController
  # before_action :set_user
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = "ユーザーをフォローしました"
      redirect_to user
    else
      flash[:success] = "ユーザーをフォローしました"
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = "ユーザーのフォロー解除しました"
      redirect_to user
    else
      flash[:success] = "ユーザーのフォロー解除失敗"
      redirect_to user
    end
  end

  # private
  # def
  #   @user = User.find(params[:relationship][:follow_id])
  # end
end
