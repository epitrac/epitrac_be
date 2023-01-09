class Disease < ApplicationRecord
  validates_presence_of :disease, :information, :link, :short_name

  def self.partial_match(short_name)
    Disease.where("short_name ILIKE?", "%#{short_name}%")
  end
end