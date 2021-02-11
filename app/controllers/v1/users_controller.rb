# app/controllers/v1/users_controller.rb
module V1
  class UsersController < ApiController
    skip_before_action :authenticate_user_from_token!, only: [:create]

    def index
      render json: User.all, each_serializer: V1::UserSerializer
    end

    # POST
    # Create an user
    def create
      @user = User.new user_params
      @profile = @user.build_profile

      if @user.save!
        render json: @user, serializer: V1::SessionSerializer, root: nil
      else
        render json: { error: t('user_create_error') }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end