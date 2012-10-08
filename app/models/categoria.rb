class Categoria
  include Mongoid::Document
  field :nombre, type: String
  field :descripcion, type: String
  
  belongs_to :eventos
end
