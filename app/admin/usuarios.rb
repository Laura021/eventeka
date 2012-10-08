ActiveAdmin.register Usuario do
  actions :all, :except => [:destroy]
  index do
    column :nombre
    column :email
    default_actions 
    
  end
  
  show :nombre =>:nombre do |user|
    attributes_table do
      row "Nombre" do user.nombre end
      row "Correo" do user.email end
    end
  end 
  
  form do |f|
    f.inputs "Usuarios" do
      f.input :nombre
      f.input :email
      f.input :password
    end
  end
  
end
