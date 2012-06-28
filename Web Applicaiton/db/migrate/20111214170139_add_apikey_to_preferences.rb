class AddApikeyToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :apikey, :string
  end
end
