# frozen_string_literal: true

module AdminsBackoffice
  class QuestionsController < AdminsBackofficeController
    before_action :set_question, only: %i[edit update destroy]
    before_action :list_subjects, only: %i[new edit]

    def index
      @questions = Question.includes(:subject).order(:description).page(params[:page])
    end

    def new
      @question = Question.new
    end

    def edit
      @question = Question.find(params[:id])
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to admins_backoffice_questions_path, notice: 'Question successfully created'
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to admins_backoffice_questions_path, notice: 'Question was successfully updated'
      else
        render :edit
      end
    end

    def destroy
      if @question.destroy
        redirect_to admins_backoffice_questions_path, notice: 'Question was successfully deleted.'
        Rails.logger.debug @question
      else
        render :index
      end
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:description, :subject_id,
                                       answers_attributes: %i[id description correct _destroy])
    end

    def list_subjects
      @subjects = Subject.all
    end
  end
end
