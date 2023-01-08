class Disease < ApplicationRecord
  validates_presence_of :disease, :information, :link

  def self.partial_match(disease)
    Disease.where("disease ILIKE?", "%#{disease}%")
  end
end