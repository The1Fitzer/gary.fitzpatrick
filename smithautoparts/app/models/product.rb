class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price

  def self.search(search_query)
    if search_query
      find(:all, :conditions => ['name LIKE ?', "%#{search_query}%"])
    else
      find(:all)
    end
  end
end
