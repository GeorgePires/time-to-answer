# frozen_string_literal: true

module AdminsBackoffice
  class SubjectsController < ApplicationController
    before_action :set_subject, only: %i[edit update destroy]

    def index
      @subjects = Subject.all.page(params[:page])
    end

    def new
      @subject = Subject.new
    end

    def edit
      @subject = Subject.find(params[:id])
    end

    def create
      @subject = Subject.new(subject_params)
      if @subject.save
        redirect_to admins_backoffice_subjects_path, notice: 'Subject successfully created'
      else
        render :new
      end
    end

    def update
      if @subject.update(subject_params)
        redirect_to admins_backoffice_subjects_path, notice: 'Subject was successfully updated'
      else
        render :edit
      end
    end

    def destroy
      if @subject.destroy
        redirect_to admins_backoffice_subjects_path, notice: 'Subject was successfully deleted.'
      else
        render :index
      end
    end

    private

    def set_admin
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:description)
    end
  end
end
