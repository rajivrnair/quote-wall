require 'webmachine'
require 'json'

class JsonResource < Webmachine::Resource
  
  # Define handler for outgoing json responses
  def content_types_provided
    [["application/json", :to_json]]
  end
 
  # Define handler for incoming json requests
  def content_types_accepted
    [["application/json", :from_json]]
  end
 
  private
  def params
    JSON.parse(request.body.to_s)
  end
end