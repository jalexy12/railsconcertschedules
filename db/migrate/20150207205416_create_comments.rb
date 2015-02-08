class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :concertid
      t.integer :userid
      t.text :comment

      t.timestamps null: false
    end
  end
end
