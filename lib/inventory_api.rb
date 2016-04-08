require 'httparty'
class InventoryApi
  include HTTParty
  format :json
 
  base_uri "52.37.73.85"
 
  def self.get_all(model)
    response = get("/#{model}")
    if response.success?
      response["data"]
    else
      raise response.response
    end
  end

  def self.get_by_id(model, id)
    response = get("/#{model}/#{id}")
  end

  def self.post_to_server(params)
    response = post('/customers', :body => params.to_json, :headers => { 'Content-Type' => 'application/json' })
  end

  def self.patch_to_server(params)
    response = patch("/customers/#{params[:id]}", :body => params.to_json, :headers => { 'Content-Type' => 'application/json' })
  end

  def self.delete_to_server(params)
    response = delete("/customers/#{params[:id]}")
  end

end
