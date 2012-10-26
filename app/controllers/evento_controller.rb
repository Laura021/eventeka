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
    @evento = Evento.new
  end
  
  def editar
    @evento = Evento.find(params[:id])
    
  end
  
  def update
    @evento = Evento.find(params[:id])
    @evento.update_attributes(params[:evento])
    #Evento.find(params[:id]).update_attributes(params[:evento])  
    
    #Evento.update params[:evento]
    redirect_to :action => 'index'
    
    
  end
  
  def eliminar
    @eventos_detail = Evento.find(params[:id])   
    Evento.find(params[:id]).delete
    redirect_to :action => 'index'
  end
    
  
end
