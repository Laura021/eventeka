class Sugerencia
  include Mongoid::Document
  field :categoria, type: String
  field :ciudad, type: String
  field :texto, type: String
end
