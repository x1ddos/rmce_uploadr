require 'spec_helper'

describe "Core extensions" do
  describe Mash do
    before(:each) do
      @mash = Mash[:key1 => "val1", "key2" => "val2"]
    end
    
    it "should return a value by a method call" do
      @mash.key1.should == "val1"
      @mash.key2.should == "val2"
    end
  end
end