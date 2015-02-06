class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :name
      t.datetime :date
      t.string :artist
      t.string :venue
      t.string :city
      t.integer :ticketprice
      t.text :description

      t.timestamps null: false
    end
  end
end
