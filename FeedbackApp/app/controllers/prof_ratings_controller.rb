class ProfRatingsController < ApplicationController
  @@prof_id=0, @@course_number=0
  def new
    @prof_rating = ProfRating.new
    @@prof_id = params[:prof_id]
    @@course_number = params[:course_number]

  end

  def create
    logger.info params
    @prof_rating_id = ProfRating.where(:professor_id=>@@prof_id.to_i,
                                       :doubt_solving => params[:prof_rating][:doubt_solving].to_i,
                                       :knowledge => params[:prof_rating][:knowledge].to_i,
                                       :course_material => params[:prof_rating][:course_material].to_i,
                                       :fluency => params[:prof_rating][:fluency].to_i).first
    if @prof_rating_id.nil? then
      @prof_rating_id = ProfRating.new(:professor_id=>@@prof_id.to_i,
                                       :doubt_solving => params[:prof_rating][:doubt_solving].to_i,
                                       :knowledge => params[:prof_rating][:knowledge].to_i,
                                       :course_material => params[:prof_rating][:course_material].to_i,
                                       :fluency => params[:prof_rating][:fluency].to_i)

      if @prof_rating_id.save
        #redirect to course feedback forrm with prof rating as a parameter
        redirect_to(:controller => 'feedbacks', :action => 'new',:id=>@prof_rating_id,  :prof_id =>@@prof_id,
                  :course_number => @@course_number )

      end

    else
      #redirect to course feedback forrm with prof rating as a parameter
      redirect_to(:controller => 'feedbacks', :action => 'new',:id=>@prof_rating_id,  :prof_id =>@@prof_id,
                  :course_number => @@course_number )
    end
end


  def prof_ratings_params
  #  params.require(:prof_rating).permit(:fluency, :course_material, :knowledge, :doubt_solving)
  end
end

