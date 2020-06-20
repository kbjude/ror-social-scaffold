class FriendshipsController < ApplicationController
    def create
        @user = current_user
        @possible_friend = User.find(params[_user_id])
        @user.send_request(@friend)
        redirect_back(fallback_location: :back)
    end
    def show
    end
    def decline
    end
    def confirm
    end
end
