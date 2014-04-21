require File.dirname(__FILE__) + '/../lib/hello'

describe "hello" do
 it "is fine" do
   expect(Hello.new.hi).to eql("hello")
 end
end
