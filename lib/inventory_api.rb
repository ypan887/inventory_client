require 'httparty'
class InventoryApi
  include HTTParty
  format :json
 
  base_uri "52.37.73.85"
 
  def self.get_all(model)
    response = get("/#{model}")
    response["data"]
  end

  def self.post_to_server(model, params)
    response = post("/#{model}", :body => params.to_json, :headers => { 'Content-Type' => 'application/json' })
  end

  def self.patch_to_server(model, params)
    response = patch("/#{model}/#{params[:id]}", :body => params.to_json, :headers => { 'Content-Type' => 'application/json' })
  end

  def self.delete_to_server(params)
    response = delete("/customers/#{params[:id]}")
  end

end
