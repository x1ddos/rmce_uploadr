require 'spec_helper'

describe Sinatra::RMceUploadr::ImagesController, :type => :controller do
  before(:each) do
    @image_data = mock("image data", :url => "image url")
    @image = mock("image", :data => @image_data, :size_in_bytes => "10Kb", :geometry => "10x11")
    
    RMceUploadr::Image.stub!(:find).and_return(@image)
    RMceUploadr::Image.stub!(:all).and_return([@image])
  end
  
  it "should find all images" do
    RMceUploadr::Image.should_receive(:all)
    get '/rmce_uploadr/images'
  end
  
  it "should render found images" do
    get '/rmce_uploadr/images'
    last_response.body.gsub(/[\n\r]/, '').should =~ /<img .*src="image url" .*data-src-original="image url"/
  end
  
  it "should display image size and geometry" do
    get '/rmce_uploadr/images'
    last_response.body.should =~ /<span .*>#{@image.size_in_bytes}, #{@image.geometry}/
  end
  
  it "should say something of no images found" do
    RMceUploadr::Image.stub!(:all).and_return([])
    get '/rmce_uploadr/images'
    last_response.body.should =~ /no images found/i
  end
end
