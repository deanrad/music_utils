# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_theoryweb_session',
  :secret      => 'b8a0ac701c250545275c9065e1c572251203b3b7919afc808cc2bb3f082364419e711e46bdcbcb38cd1f073ab964879f3aa336aa1c93c515ab28ef4274bb358d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
