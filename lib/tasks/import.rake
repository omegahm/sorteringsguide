require 'csv'
namespace :import do
  desc "Import all signs"
  task :signs => :environment do
    CSV.foreach("lib/static_data/signs20131010.csv", col_sep: ',', headers: true) do |row|
      # Faction | Name | Comment |
      #    0    |  1   |    2    |
      sign = Sign.find_or_initialize_by(name: row[1])
      sign.faction_number ||= row[0]
      sign.name           ||= row[1]
      sign.comment        ||= row[2]
      sign.category       ||= 'Blå'
      sign.search_terms   ||= ''

      if sign.save!
        print '.'
      else
        print 'x'
      end
    end
  end
end
