class SugerenciaController < ApplicationController
  
  def index
    @sugerencia = Sugerencia.all
  end
  
  def create
    @sugerencia = Sugerencia.create params[:sugerencia]
    redirect_to :action => 'index'
   
  end
    
  def nuevo
    @sugerencia = Sugerencia.new
  end  
end
