# frozen_string_literal: true

module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    def index
      @admins = Admin.all
    end

    def edit
      @admin = Admin.find(params[:id])
    end

    def update
      @admin = Admin.find(params[:id])
      if @admin.update_attributes(params[:admin_params])
        flash[:success] = 'Admin was successfully updated'
        redirect_to @admin
      else
        flash[:error] = 'Something went wrong'
        render 'edit'
      end
    end

    def destroy
      @admin = Admin.find(params[:id])
      if @admin.destroy
        flash[:success] = 'Object was successfully deleted.'
        redirect_to admins_backoffice_admins_path
      else
        flash[:error] = 'Something went wrong'
        redirect_to admins_backoffice_admins_path
      end
    end
  end
end
