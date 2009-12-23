# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mcsd_session',
  :secret      => '8263ba7205c7c8872d2caf562912fd264232274ca25d6b745123a822bce62ed03187f95b2af4e141f6df35a236d158afd0d22c036c30f2aac2eb22f1d1df2dc8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
