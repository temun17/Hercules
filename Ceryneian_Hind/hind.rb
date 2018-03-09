=begin
 Required Files.
=end

require 'oauth2'
require 'colorize'

=begin
 Create the client with the credentials (user id & secret key),
 get an acess token.
=end

UID = ENV["SUID"]
SECRET = ENV["SECRET"]
client = OAuth2::Client.new(
UID, 
SECRET, 
site: "https://api.intra.42.fr")
token = client.client_credentials.get_token

# Open text file, and loop every line in the file
# Remove whitespaces from every user login, to parse them correctly

if ARGV[0]
	if File.extname(ARGV[0]) == ".txt"
		File.open(ARGV[0]).each_line do |line|
			username = line.chomp
			begin
				location = token.get("/v2/users/#{username}/locations").parsed
				if location[0]
					host = location[0]["host"]
					puts "#{username} ".green + "is in zone #{host}".yellow
				else
					puts "#{username} ".green + "is unavailable".red
				end
			rescue
				puts "#{username} ".green + "does not exist".magenta
			end
		end
	end
else
	puts "Usage: ruby api.rb [students.txt]".red
end
