class SugerenciaController < ApplicationController
  
  def index
    @sugerencia = Sugerencia.all
  end
  
  def create
    @sugerencia = Sugerencia.create params[:sugerencia]
    
  end
    
  def nuevo
    @sugerencia = Sugerencia.new
  end  
end
