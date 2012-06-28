class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :customer_email
      t.string :linkstylesheet
      t.integer :contactnumber
      t.string :address1
      t.string :address2
      t.string :town
      t.string :county
      t.string :country
  
      t.timestamps
    end
  end
end
