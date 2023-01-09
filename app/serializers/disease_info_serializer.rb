class DiseaseInfoSerializer
  include JSONAPI::Serializer
  attributes :disease, :short_name, :information, :link
end