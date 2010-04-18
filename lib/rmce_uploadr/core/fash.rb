# A paperclip-like UpFile class
#
# Paperclip checks for :original_filename and :content_type
# so, let's giv'em to it
#
# the other attributes are :to_tempfile and :size but those are
# handled by Mash's :method_missing
class Fash < File
  # rack_multipart is what you get when 
  # a multipart-encoded form is submitted
  #
  # converts a standard rack multipart file upload
  # to an object paperclip will understand
  def initialize(rack_multipart)
    @original = rack_multipart
    super(rack_multipart.is_a?(String) ? rack_multipath : @original[:tempfile].path)
  end
  
  def to_tempfile
    @original[:tempfile] || @original
  end
  
  alias :paperclip_original_filename :original_filename
  def original_filename
    @original[:filename] || paperclip_original_filename
  end
  
  alias :paperclip_content_type :content_type 
  def content_type
    @original[:type] || paperclip_content_type
  end
end
