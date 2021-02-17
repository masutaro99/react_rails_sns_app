module V1
  class FriendRequestsController < ApiController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show, :create]

    def index
      render json: FriendRequest.all, each_serializer: V1::FriendRequestSerializer
    end
    def show
      @friend_request = FriendRequest.find(params[:id])
      render json: @friend_request, each_serializer: V1::FriendRequestSerializer
    end
    def update
      @friend_request = FriendRequest.find(params[:id])
      @friend_request.update(friendrequest_params)
    end
    def create
      friend_request = FriendRequest.new(friendrequest_params)
      friend_request.save
    end

    private

    def friendrequest_params
      params.require(:friendrequest).permit(:askFrom_id, :askTo_id, :approved)
    end
  end
end