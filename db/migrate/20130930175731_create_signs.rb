class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :name
      t.string :faction_number
      t.text :search_terms
      t.text :comment
      t.string :category

      t.timestamps
    end
  end
end
