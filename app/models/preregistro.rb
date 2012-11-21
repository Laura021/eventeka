class Preregistro
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  
  field :email,:type => String
  field :fecha, type: Time
end