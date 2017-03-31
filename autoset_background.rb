
### Configuration ###
image_url = 'https://source.unsplash.com/random/'
directory_path = '.background_images/'


### Script ###
require 'open-uri'

# Check if images directory already exists
# If it does, delete anything inside it
# If not, create it
if File.directory?( directory_path )
  `rm #{ directory_path }*`
else
  `mkdir #{ directory_path }`
end

# Set path variables
img_name = "#{ rand( 1...999999999999 ) }"
img_path = directory_path + img_name + '.jpg'
path = `pwd`.delete!("\n")

# Take the image from de Unsplash<3 API
open( image_url ) { | f |
   File.open( img_path, 'wb' ) do | file |
     file.puts f.read
   end
}

# Set the image as background
`osascript -e 'tell application "Finder" to set desktop picture to "#{path}/#{img_path}" as POSIX file'`