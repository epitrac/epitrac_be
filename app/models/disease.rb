class Disease < ApplicationRecord
  validates_presence_of :disease, :information, :link
end