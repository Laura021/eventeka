class HomeController < ApplicationController

  def index
    @ciudades_list= Ciudad.all 
  end
  
  def sugerencias
    
  end
  
  def soon
    @registro = Preregistro.new
  
  end

  def registrar
    @registro = Preregistro.create params[:preregistro]
    redirect_to root_path
  end
    



end #din de home controller

