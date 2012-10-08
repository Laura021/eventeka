class ServiciosController < ApplicationController
  
  #Clase con todos los servicios que consumir{a la app de iPhone!
  
  def index

  end
  
  #########    Categorias    #########
  
  def listado_categorias
    @categos =  Categoria.all
    
    respond_to do |format|
      format.json {render json: @categos.to_json}
    end 
    
  end
  
  def catego_detail
    @catego_detail =  Categoria.find(params[:id])
    
    respond_to do |format|
      format.json {render json: @catego_detail.to_json}
    end 
  end
  
  #########    Ciudad   #########
  
  def listado_ciudad
    @ciudades = Ciudad.all
    
    respond_to do |format|
      format.json {render json: @ciudades.to_json}
    end 
    
  end
  
  def consulta_ciudad
    @ciudad_detail = Ciudad.find(params[:id])
    
    respond_to do |format|
      format.json {render json: @ciudad_detail.to_json}
    end 
  end 
  
  #########   Evento    #########
  
  def listado_evento
    @eventos = Evento.all
    
    respond_to do |format|
      format.json {render json: @eventos.to_json}
    end 
  end
  
  def consulta_evento
   @evento_detail = Evento.find(params[:id])
   
   respond_to do |format|
      format.json {render json: @evento_detail.to_json}
   end 
  end
  
  
  #########   Usuario   #########
  
  def info_usuario
   @usuario = current_usuario
    
   respond_to do |format|
      format.json {render json: @usuario.to_json}
   end 
  end
  
  
  
  
  
end