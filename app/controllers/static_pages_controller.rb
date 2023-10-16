class StaticPagesController < ApplicationController
  def top
    @first_step = DiagnosisQuestion.pluck(:id).first
  end
end
