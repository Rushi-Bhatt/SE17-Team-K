class ProfessorsController < ApplicationController

  def dynamic_profs
    @profs=Professor.all
  end
  def professor_params
    params.require(:professor).permit(:id, :name)
  end
end
