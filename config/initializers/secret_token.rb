# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Sorteringsguide::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || 'eb5f26aca28978abe0692e08a1a0e5c6d9c6b40ea23499d04e8a1a1810d11b06efe6ef7fa9e869b3b2c29e4ace127be55ca39e2f78e01a7836fc22a6a1bad64d'
