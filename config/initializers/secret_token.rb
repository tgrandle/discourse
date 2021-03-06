
# Definitely change this when you deploy to production. Ours is replaced by jenkins.
# This token is used to secure sessions, we don't mind shipping with one to ease test and debug,
#  however, the stock one should never be used in production, people will be able to crack 
#  session cookies. 
#

# Discourse::Application.config.secret_token = "SET_SECRET_HERE" 

# delete all lines below in production
if Rails.env.test? || Rails.env.development? 
  Discourse::Application.config.secret_token = "47f5390004bf6d25bb97083fb98e7cc133ab450ba814dd19638a78282b4ca291" 
else 
	# tjg for heroku production
	if Rails.env.production? && ENV['SECRET_TOKEN'].blank?
	  #let's hope heroku handles this at runtime
	  #raise 'SECRET_TOKEN environment variable must be set!'
	end	
	Discourse::Application.config.secret_token = ENV['SECRET_TOKEN']

	#let's hope heroku handles this at runtime
	#if Discourse::Application.config.secret_token.blank?
  	#	raise "You must set a secret token in config/initializers/secret_token.rb"
  	#end
end

