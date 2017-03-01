class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new

  end

  def create

  end

  def save

  end

  def feedback_params
    params.permit(:id, :user_id, :num_of_exam, :num_of_project,:num_of_assignment,:fav_factor,:section_id,:job,:workload,:grade,:relate_course,:quality_of_lecture,:category)
  end
end
