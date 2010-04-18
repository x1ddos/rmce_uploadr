require 'spec_helper'

describe RMceUploadr::Image do  
  before(:each) do
    @tmpfile = mock("uploaded image file")
    @image = RMceUploadr::Image.new(:data => @tmpfile, :tempfile => "temp file path")
    @image.stub!(:data).and_return(@tmpfile)
    @image.stub!(:save_attached_files).and_return(true)
  end
  
  it "should have :data- methods" do
    @image.should respond_to(:data)
    @image.should respond_to(:data=)
  end
  
  describe "saving an object" do
    before(:each) do
      @geometry = mock("geometry", :width => 10, :height => "11")
      Paperclip::Geometry.stub!(:from_file).and_return(@geometry)
    end
    
    it "should have a callback to calculate original image geometry" do
      @image.should_receive(:update_image_geometry)
      @image.save
    end
    
    it "should use Paperclip::Geometry to calculate width and height" do
      Paperclip::Geometry.should_receive(:from_file).with("temp file path")
      @image.should_receive(:width=).with(@geometry.width.to_i)
      @image.should_receive(:height=).with(@geometry.height.to_i)
      @image.save
    end
  end
end
