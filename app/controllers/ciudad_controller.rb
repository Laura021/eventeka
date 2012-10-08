class CiudadController < ApplicationController
  
  def index 
    @ciudades = Ciudad.all
  end
  
  def show
    @ciudad_detail = Ciudad.find(params[:id])
   
    @ciudad_id = @ciudad_detail.id
   # logger.debug("ciudad_id: #{@ciudad_id}")
        
   @eventos_ciudad = Array.new
   
   Evento.each do |evento|  
      
      if evento.ciudad_id == @ciudad_id 
          @eventos_ciudad.push(evento)
      end       
   end
   # logger.debug "eventos-ciudad #{@eventos_ciudad.to_yaml}"
  end
  
  
  def deserializeObjectId(value)
    value = Moped::BSON::Document.deserialize(value)
    logger.debug "metodo de deseailize: #{value.to_yaml} " 
    return value;
  end
  

end
