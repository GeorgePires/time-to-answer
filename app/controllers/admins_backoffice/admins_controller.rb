# frozen_string_literal: true

module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :set_admin, only: %i[edit update destroy]
    before_action :verify_password, only: %i[update]

    def index
      @admins = Admin.all.page(params[:page])
    end

    def new
      @admin = Admin.new
    end

    def edit
      @admin = Admin.find(params[:id])
    end

    def create
      @admin = Admin.new(admin_params)
      if @admin.save
        redirect_to admins_backoffice_admins_path, notice: 'Admin successfully created'
      else
        render :new
      end
    end

    def update
      if @admin.update(admin_params)
        redirect_to admins_backoffice_admins_path, notice: 'Admin was successfully updated'
      else
        render :edit
      end
    end

    def destroy
      if @admin.destroy
        redirect_to admins_backoffice_admins_path, notice: 'Admin was successfully deleted.'
      else
        render :index
      end
    end

    private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end

    def verify_password
      if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
        params[:admin].extract!(:password, :password_confirmation)
      end
    end
  end
end
