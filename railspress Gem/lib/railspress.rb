require 'rubygems'
require 'rest-client'
require 'json'
require 'etc'

module Railspress
  class Railspress
    class << self
       def setup(apikey)
          user = Etc.getlogin
 	        filename = "/Users/#{user}/Desktop/railspressdata/apikey.txt"
 	        File.open(filename, 'w') do |f|
 	          f.puts apikey
 	        end
 	        puts "API Key saved to your desktop"
       end
     end

     def initialize
	     @apikey = 0
     end

     def prefs
        user = Etc.getlogin
	     #Read APIKey from file
        filelocation = "/Users/#{user}/Desktop/railspressdata/apikey.txt"
        file = File.new(filelocation, 'r')
        while (line = file.gets)
          apikey = line.split.join("\n")
        end
        file.close
	     
	     #Send GET Request using RestClient
	     #Change Here
	     puts "Retrieving your preferences....\n\n"
	     data = RestClient.get 'http://0.0.0.0:3000/preferences/grab', {:params => {:apikey => apikey}}
      
       prefslocation = "/Users/#{user}/Desktop/railspressdata/prefs.txt"
       sleep 3
       puts "Storing your preferences for building later....\n\n"
       File.open(prefslocation, 'w') do |f|
         f.puts data
        end
	    end
	    sleep 3
	    puts "Finished storing your preferences...."
	    def build
	     user = Etc.getlogin
	     #Open files containing your preferences
	     prefs = "/Users/#{user}/Desktop/railspressdata/prefs.txt"
	     file = File.new(prefs, 'r')
	      data = file.gets
	     file.close
	     
	     #Parse the JSON
	     result = JSON.parse(data)
	     
	     #Converting fixnum to string
	     contact_number = result[0]['contactnumber'].to_s
	     
	     #Open template file
	     template = "/Users/#{user}/Desktop/railspressdata/template.html"
	     puts "Opening the template....\n"
	     sleep 3
	     text = File.read(template)
	     puts "Replacing the gobbldygook with whats important....\n"
	     sleep 3
	      #Use a destructor gsub to fully replace what is needed
	      text.gsub!(/#title#/, result[0]['address1'])
	      text.gsub!(/#color#/, result[0]['linkstylesheet'])
	      text.gsub!(/#add1#/, result[0]['address1'])
	      text.gsub!(/#add2#/, result[0]['address2'])
	      text.gsub!(/#town#/, result[0]['town'])
	      text.gsub!(/#county#/, result[0]['county'])
	      text.gsub!(/#country#/, result[0]['country'])
	      text.gsub!(/#email#/, result[0]['customer_email'])
	      text.gsub!(/#number#/, contact_number)
	    puts "Saving your new E-Business Card....\n"
	    sleep 3
	     #Open the file for writing
	     your_file = "/Users/#{user}/Desktop/railspressdata/#{result[0]['address1']}.html"
	     File.open(your_file, 'w') do |f|
	       #Write the changes
	       f.puts text
	     end
	    puts "All Done :)  Please check the folder 'railspressdata' on your desktop for your HTML file"
     end
   end
end
