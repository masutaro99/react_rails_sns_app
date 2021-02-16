# app/controllers/v1/profiles_controller.rb
module V1
  class ProfilesController < ApiController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]
    before_action :set_target_profile, only: %i[show update]

    def index
      render json: Profile.all, each_serializer: V1::ProfileSerializer
    end
    def show
      render json: @profile, each_serializer: V1::ProfileSerializer
    end
    def update
      @profile.update(profile_params)
    end
    def mypage
      profile = Profile.find_by(user_id: current_user.id)
      render json: profile, each_serializer: V1::ProfileSerializer
    end
    def image_upload
      image_path = "public/user_id_#{current_user.id}.jpg"
      if params[:image]
        image=params[:image]
        File.binwrite(image_path, image.read)
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:nickName, :image, :image_cache, :remove_image)
    end
    def set_target_profile
      @profile = Profile.find(params[:id])
    end
  end
end