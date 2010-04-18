require 'spec_helper'

describe "Main layout", :type => :controller do
  before(:all) do
    RMceUploadr::Image.stub!(:all).and_return([])
    app.set :cdn_host, "http://mycdn.host.com/"
  end
  
  it "should set javascript global cdn host variable" do
    get '/rmce_uploadr/images'
    last_response.body.should =~ /var +uploadrCdnHost += +["']http:\/\/mycdn\.host\.com\/["'];/
  end
end