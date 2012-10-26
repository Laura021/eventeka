class Evento
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  
  field :nombre, type: String
  field :descripcion, type: String
  field :fecha, type: Time
  field :direccion, type: String
  field :imagen_path, type: String
  field :website, type: String
  field :latitud, type: Float
  field :longitud, type: Float
  
  belongs_to :usuario
  belongs_to :ciudad
  has_and_belongs_to_many :categorias


  
end
