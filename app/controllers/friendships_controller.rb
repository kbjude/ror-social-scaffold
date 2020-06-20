class FriendshipsController < ApplicationController
    def create
        @user = current_user
        @possible_friend = User.find(params[:user_id])
        @user.send_request(@possible_friend)
        redirect_back(fallback_location: :back)
    end

    def decline
        @user = current_user
        @possible_friend = User.find(params[:user_id])
        @user.decline(@possible_friend)
        redirect_back(fallback_location: :back)
    end

    def confirm
        @user = current_user
        @possible_friend = User.find(params[:user_id])
        @user.confirm(@possible_friend)
        redirect_back(fallback_location: :back)
    end
end
