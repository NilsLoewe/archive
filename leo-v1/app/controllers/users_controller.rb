class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :edit, :update]
  before_filter :signed_in_user, only: [:show, :index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def update
    redirect_to root_path
  end

  def edit
    redirect_to edit_user_registration_path
  end

  def show
    redirect_to root_path
  end

  private

    def signed_in_user
      redirect_to new_user_session_path, notice: "Please sign in." unless user_signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
