class UsersController < ApplicationController
  before_action :find_user, only: [:show, :follow, :unfollow]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def follow
    respond_to do |format|
      if Event::FollowService.new(current_user, @user).call
        format.html { redirect_to request.referer }
        # TODO
        # format.json { render head :created }
      else
        format.html { redirect_to request.referer }
        # TODO
        # format.json { render head :bad_request }
      end
    end
  end

  def unfollow
    respond_to do |format|
      if Event::FollowService.new(current_user, @user, 'unfollow').call
        format.html { redirect_to request.referer }
        # TODO
        # format.json { render head :created }
      else
        format.html { redirect_to request.referer }
        # TODO
        # format.json { render head :bad_request }
      end
    end
  end

  def show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
