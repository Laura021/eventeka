ActiveAdmin.register Evento do

  #Tabla
  index do
        
    column :nombre
    column :descripcion
    column :fecha
    column :direccion
    column :website
    column :imagen_path
    default_actions
   
  end
  
  
  #Crear
  form do |f|
    f.inputs "Detalles del evento" do
      f.input :nombre
      f.input :descripcion
      f.input :fecha
      f.input :direccion
      f.input :website
      f.input :usuario, :collection=>Hash[Usuario.all.map {|u| [u.nombre,u.id]}], :include_blank => false
      f.input :ciudad, :collection=>Hash[Ciudad.all.map {|c| [c.nombre, c.id]}], :include_blank => false
      f.input :categorias, :collection =>Hash[Categoria.all.map {|ca| [ca.nombre, ca.id]}], :include_blank =>false
    end
    f.buttons
  end
  
  #Mostrar
  
  show :nombre =>:nombre do |evento|
    attributes_table do
      row "nombre" do evento.nombre end
      row "descripcion" do evento.descripcion end
      row "fecha" do evento.fecha end
      row "direccion" do evento.direccion end
      row "website" do evento.website end
      
      row "ciudad" do evento.ciudad.nombre end
      
      evento.categorias.each do |cat|
          row "categoria" do cat.nombre end    
      end
    
    end
  end
  
  controller do
    def index 
        if current_admin_user.role == "cliente"
           @evento= Evento.where(usuario_id: current_admin_user.id).find()
        else
           @evento= Evento.all
        end
    logger.debug "contenido de envento #{@event.to_yaml} "
    
    end #fin de index
    

  end
  
  
end
