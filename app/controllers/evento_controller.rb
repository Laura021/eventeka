class EventoController < ApplicationController
  
  def index 
    @eventos = Evento.all
  end
  
  def show
    @eventos_detail = Evento.find(params[:id])
  end
  
  def create
    @evento = Evento.create params[:evento]
    redirect_to evento_detail_path(@evento.id)
  end
  
  def nuevo
   
   if current_usuario == nil 
     redirect_to root_path
   end 

    @evento = Evento.new
  end
  
  def editar
   @evento = Evento.find(params[:id])
   
   if current_usuario.email != @evento.usuario.email
     redirect_to root_path
   end 
 
  end
  
  def update
    @evento = Evento.find(params[:id])
    @evento.update_attributes(params[:evento])

    redirect_to :action => 'index'
    
    
  end
  
  def eliminar
    @eventos_detail = Evento.find(params[:id])   
    Evento.find(params[:id]).delete
    redirect_to :action => 'index'
  end
    
  
end
