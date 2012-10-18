ActiveAdmin.register Sugerencia do
  index do
    column :id
    column :ciudad
    column :categoria
    column :texto
    default_actions
  end

end