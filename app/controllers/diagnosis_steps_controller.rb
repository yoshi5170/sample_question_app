class DiagnosisStepsController < ApplicationController
  include Wicked::Wizard

  prepend_before_action :set_steps

  def show
    @question = DiagnosisQuestion.find(step)
    current_user = User.find_by(name: "admin")
    @user_choice = current_user.user_choices.find_by(choice: @question.choices)
    @user_choice ||= UserChoice.new
    render_wizard @question
  end

  def update
    current_user = User.find_by(name: "admin")
    diagnosis_question_id = Choice.find(params[:choice_id]).diagnosis_question_id
    user_choice = current_user.user_choices.joins(:choice).find_by("choices.diagnosis_question_id": diagnosis_question_id)

    if user_choice
      user_choice.update(choice_id: params[:choice_id])
    else
      user_choice = current_user.user_choices.create(choice_id: params[:choice_id])
    end

    render_wizard user_choice
  end

private

  def set_steps
    self.steps = DiagnosisQuestion.pluck(:id)
  end
end
