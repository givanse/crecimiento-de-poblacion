class CreateZips < ActiveRecord::Migration[5.2]
  def change
    #create_table :global_feeds, id: false do |t|
    create_table :zips, id: false do |t|
      t.integer :zip, primary_key: true
      t.string :msaName
      t.integer :cbsa
      t.integer :p2014
      t.integer :p2015

      #t.timestamps
    end
  end
end
