class RMceUploadr::Image < ActiveRecord::Base
  has_attached_file :data, :styles => { :medium => "300x300>", :thumb => "100x100#" },
                    :url => "/uploads/g/images/:id_partition/:style_:filename",
                    :default_url => "/images/rmce_uploadr_default/:style.png",
                    :storage => :filesystem,
                    :path => "public/uploads/g/images/:id_partition/:style_:filename"
end