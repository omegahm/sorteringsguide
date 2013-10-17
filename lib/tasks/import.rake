require 'csv'

namespace :purge do
  desc "Purge all signs"
  task signs: :environment do
    puts Sign.where(category: 'Blå').delete_all
  end
end

namespace :import do
  desc "Import all signs"
  task signs: :environment do
    CSV.foreach("lib/static_data/signs20131010.csv", col_sep: ',', headers: true) do |row|
      next if row[0].blank?
      # Faction | Name | Comment |
      #    0    |  1   |    2    |
      sign = Sign.find_or_initialize_by(faction_number: row[0])
      sign.faction_number ||= row[0]
      sign.name           ||= row[1]
      sign.comment        ||= row[2]
      sign.category       ||= 'Blå'
      sign.search_terms     = "#{sign.search_terms}, #{row[1]}".gsub(/^\s*,/, '')

      if sign.save
        print '.'
      else
        print 'x'
      end
    end
    puts
    puts "Done"
  end
end
