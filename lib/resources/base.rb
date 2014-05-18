require 'webmachine'
require 'json'

class JsonResource < Webmachine::Resource
  def content_types_provided
    [["application/json", :to_json]]
  end
 
  def content_types_accepted
    [["application/json", :from_json]]
  end
 
  private
  def params
    JSON.parse(request.body.to_s)
  end
end