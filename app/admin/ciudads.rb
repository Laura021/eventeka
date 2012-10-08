ActiveAdmin.register Ciudad do
  menu :label =>"Ciudades",:if => proc{ can?(:manage, Ciudad)}
  controller.authorize_resource
   
  index do
    column :id
    column :nombre
    column :latitud
    column :longitud
    column :rango
    default_actions
  end
end
