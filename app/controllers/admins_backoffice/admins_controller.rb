# frozen_string_literal: true

module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    def index
      @admins = Admin.all
    end
  end
end
