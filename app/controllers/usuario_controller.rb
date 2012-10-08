class UsuarioController < ApplicationController

def show
   @usuario_detail = Usuario.find(params[:id])
   
   @eventos_usuario= Array.new
   
   Evento.each do |evento|
     
     if evento.usuario_id == @usuario_detail.id
       @eventos_usuario.push(evento)
     end
     
   end
end #fin de show

end
