class Mailboxer::AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process resize_to_fill: [100, 100]
end
