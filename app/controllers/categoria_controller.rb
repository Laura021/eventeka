class CategoriaController < ApplicationController
  
  def index
    @categorias = Categoria.all
  end
  
  def show

   @categoria_detail = Categoria.find(params[:id])
    
   @eventos_categoria = Array.new
   
   Evento.each do |evento|  
      
      if evento.categoria_ids.include?(@categoria_detail.id) 
          @eventos_categoria.push(evento)
      end       
   end

  end
    
end
