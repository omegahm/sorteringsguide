if Rails.env.production?
  Paperclip::Attachment.default_options.update({
    storage: :fog,

    fog_credentials: {
      provider:                         ENV['FOG_PROVIDER'],
      google_storage_access_key_id:     ENV['GOOGLE_STORAGE_ACCESS_KEY_ID'],
      google_storage_secret_access_key: ENV['GOOGLE_STORAGE_SECRET_ACCESS_KEY'],
    },

    fog_directory:  ENV['FOG_DIRECTORY']
  })
end
