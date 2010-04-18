# This class expects the following table attributes to be found:
#  - +data_file_name+ (string)
#  - +data_content_type+ (string)
#  - +data_file_size+ (integer)
#  - +data_updated_at+ (datetime)
#  - +width+ (integer)
#  - +height+ (integer)
class RMceUploadr::Image < ActiveRecord::Base
  has_attached_file :data, :styles => { :medium => "300x300>", :thumb => "100x100#" },
                    :url => "/uploads/g/images/:id_partition/:style_:filename",
                    :default_url => "/images/rmce_uploadr_default/:style.png",
                    :storage => :filesystem,
                    :path => "public/uploads/g/images/:id_partition/:style_:filename"
  # set in images_controller
  # needed to calcuate original file geometry in :update_image_geometry
  attr_accessor :tempfile
  
  before_save :update_image_geometry
  
  # Returns a string with width and height
  # e.g. "100x50"
  def geometry
    return "" if width.nil? || height.nil?
    "#{width}x#{height}"
  end
  
  # Convers image size in B, Kb, Mb or Gb
  # and returns something like "10Kb"
  def size_in_bytes
    case data_file_size
    when 0..1023
      "#{data_file_size}B"
    when 1024..1048575
      "#{(data_file_size / 1024.0).round}Kb"
    when 1048576..1073741823
      "#{(data_file_size / 1048576.0).round}Mb"
    else
      "#{(data_file_size / 1073741823.0).round}Gb"
    end
  end
  
  private
  
  def update_image_geometry
    unless tempfile.nil?
      begin
       geometry = Paperclip::Geometry.from_file(tempfile)
       self.width = geometry.width.to_i
       self.height = geometry.height.to_i
      rescue NotIdentifiedByImageMagickError => e; end
    end
  end
end
