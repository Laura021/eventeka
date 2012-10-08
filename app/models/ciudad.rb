class Ciudad
  include Mongoid::Document
  field :nombre, type: String
  field :latitud, type: Float
  field :longitud, type: Float
  field :rango, type: Float
  
  has_many :eventos
end
