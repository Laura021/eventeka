class CalendarioController < ApplicationController

  def index
    #Mostrar todos los eventos ordenados por fecha
    @eventos_fecha = Evento.all.asc(:fecha)
    
    @fecha_base = @eventos_fecha.first
    
  end
  
  def agregar
    #Agregar un evento al calendario personal
    
  end

  def rating
    #Dar puntuacion al evento en particular
    
  end
  
  def mostrar_mapa
    #No tengo idea que se necesite,pero ya lo contemplo
  end

end

