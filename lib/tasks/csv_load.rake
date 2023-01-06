require 'csv'

namespace :csv_load do
  task diseases: :environment do
    CSV.foreach('./db/data/nndss_diseases_info.csv', headers: true) do |row|
      Disease.create!(row.to_hash)
    end
    # ActiveRecord::Base.connection.reset_pk_sequence!('diseases')
  end
end