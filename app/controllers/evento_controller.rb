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
  
end
