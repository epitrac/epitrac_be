class Disease < ApplicationRecord
  validates_presence_of :disease, :information, :link, :short_name

  def self.partial_match(disease)
    Disease.where("disease ILIKE?", "%#{disease}%")
  end
end