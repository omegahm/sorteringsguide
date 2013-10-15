if Rails.env.production?
  Paperclip::Attachment.default_options.update({
    storage: :fog,
    url: "#{ENV['FOG_DIRECTORY']}.storage.googleapis.com",

    fog_credentials: {
      provider:                         'Google',
      google_storage_access_key_id:     ENV['GOOGLE_STORAGE_ACCESS_KEY_ID'],
      google_storage_secret_access_key: ENV['GOOGLE_STORAGE_SECRET_ACCESS_KEY'],
    },

    fog_public:   true,
    fog_directory:  ENV['FOG_DIRECTORY'],
  })
end
