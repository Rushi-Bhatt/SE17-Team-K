class ProfRatingsController < ApplicationController

  def new
    @prof_rating = ProfRating.new
    @prof_id = params[:id]

  end

  def create
    @prof_ratin = ProfRating.new(:professor_id=>@prof_id.to_i, :doubt_solving => params[:doubt_solving].to_i,:knowledge => params[:knowledge].to_i,:course_material => params[:course_material].to_i,:fluency => params[:fluency].to_i)
    if @prof_ratin.save
      #redirect to course feedback form

    end
  end



  def prof_ratings_params
  #  params.require(:prof_rating).permit(:fluency, :course_material, :knowledge, :doubt_solving)
  end
end

