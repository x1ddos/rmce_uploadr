require 'spec_helper'

describe RMceUploadr::App do
  before(:each) do
    RMceUploadr.stub!(:dbconf=).and_return(true)
  end
  
  describe "settings" do
    it "should set cdn_host" do
      RMceUploadr::App.should_receive(:set).with(:cdn_host, "http://cdn.host.com/")
      RMceUploadr::App.new do |conf|
        conf.settings.set :cdn_host, "http://cdn.host.com/"
      end
    end
    
    it "should have static option enabled" do
      RMceUploadr::App.static.should be_true
    end
    
    it "should have set app root path" do
      RMceUploadr::App.root.should =~ /.*\/lib\/rmce_uploadr$/
    end
    
    it "should have set a public dir" do
      RMceUploadr::App.public.should =~ /.*\/lib\/rmce_uploadr\/public$/
    end
    
    it "should have set views dir" do
      RMceUploadr::App.views.should =~ /.*\/lib\/rmce_uploadr\/views$/
    end
    
    it "should call main module's dbconf= method" do
      RMceUploadr.should_receive(:dbconf=).with({:adapter => 'myadapter', :database => 'mydb'}).and_return(true)
      RMceUploadr::App.new do |app|
        app.dbconf = {:adapter => 'myadapter', :database => 'mydb'}
      end
    end
  end
end
