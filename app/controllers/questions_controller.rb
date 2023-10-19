class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    answers = answers = diagnosis_question_params.values
    total_score = answers.map(&:to_i).sum
    session[:total_score] = total_score
    redirect_to result_questions_path
  end

  def result
    total_score = session[:total_score]
    if total_score
      @diagnosis_result = Result.find_by("min_score <= ? AND max_score >= ?", total_score, total_score)
      session.delete(:total_score)
    else
      redirect_to root_path, danger: "診断し直してください"
      return
    end
  end

  private

  def diagnosis_question_params
    params.require(:result).permit(:answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_7, :answer_8, :answer_9, :answer_10)
  end
end
