# frozen_string_literal: true

module UsersBackoffice
  class ProfileController < UsersBackofficeController
    before_action :verify_password, only: %i[update]
    before_action :set_user

    def edit
      @user.build_user_profile if @user.user_profile.blank?
    end

    def update
      if @user.update(params_user)
        bypass_sign_in(@user)
        redirect_to users_backoffice_profile_path, notice: 'User was successfully updated'
      else
        render :edit
      end
    end

    private

    def set_user
      @user = User.find(current_user.id)
    end

    def params_user
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                   user_profile_attributes: %i[id address gender birthdate])
    end

    def verify_password
      return unless params[:user][:password].blank? && params[:user][:password_confirmation].blank?

      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
