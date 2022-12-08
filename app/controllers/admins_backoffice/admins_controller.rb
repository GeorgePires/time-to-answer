# frozen_string_literal: true

module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :set_admin, only: %i[edit update]

    def index
      @admins = Admin.all
    end

    def edit
      @admin = Admin.find(params[:id])
    end

    def update
      if @admin.update(admin_params)
        redirect_to admins_backoffice_admins_path, notice: 'Admin was successfully updated'
      else
        render :edit
      end
    end

    private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
  end
end
