class ServiciosController < ApplicationController
  respond_to :json
  #Clase con todos los servicios que consumir{a la app de iPhone!
  
  def index

  end
  
  #########    Categorias    #########
  
  def listado_categorias
    @categos =  Categoria.all
    
    respond_with(@categos)
    
  end
  
  def catego_detail
    @catego_detail =  Categoria.find(params[:id])
    
     respond_with(@catego_detail)
  end
  
  #########    Ciudad   #########
  
  def listado_ciudad
    @ciudades = Ciudad.all
    
    respond_with(@ciudades)
  end
  
  def consulta_ciudad
    @ciudad_detail = Ciudad.find(params[:id])
    
    respond_with(@ciudad_detail)
  end 
  
  #########   Evento    #########
  
  def listado_evento
    @eventos = Evento.all
    
    respond_with(@eventos)
  end
  
  def consulta_evento
   @evento_detail = Evento.find(params[:id])
   
   respond_with(@evento_detail)
  end
  
  
  #########   Usuario   #########
  
  def info_usuario
   @usuario = current_usuario
    
    respond_with(@usuario)
  end
  
  ####### tutifruti ########
  
  def ciudad_eventos
    
    @ciudad_detail = Ciudad.find(params[:id])
   
    @ciudad_id = @ciudad_detail.id
        
    @eventos_ciudad = Array.new
   
    Evento.each do |evento|  
      
      if evento.ciudad_id == @ciudad_id 
          @eventos_ciudad.push(evento)
      end       
   end
   
   respond_with(@eventos_ciudad)
    
  end
    
  
  #########   Fechas   ###########
  
  
end