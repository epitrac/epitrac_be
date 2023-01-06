class DiseaseInfoSerializer
  include JSONAPI::Serializer
  attributes :disease, :information, :link
end