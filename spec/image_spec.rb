require 'spec_helper'

describe RMceUploadr::Image do
  before(:each) do
    RMceUploadr::Image.stub!(:columns).and_return([])
    @image = RMceUploadr::Image.new
  end
  
  it "should have :data- methods" do
    @image.should respond_to(:data)
    @image.should respond_to(:data=)
  end  
end
