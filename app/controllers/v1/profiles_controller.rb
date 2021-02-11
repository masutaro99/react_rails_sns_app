# app/controllers/v1/profiles_controller.rb
module V1
  class ProfilesController < ApiController
    skip_before_action :authenticate_user_from_token!, only: [:index]
    def index
      render json: Profile.all, each_serializer: V1::ProfileSerializer
    end

  end
end