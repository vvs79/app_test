class User < ActiveRecord::Base
  mount_uploader :file, FileUploader
end
