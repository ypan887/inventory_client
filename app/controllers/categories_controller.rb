class CategoriesController < ApplicationController
  require 'inventory_api'
  
  def index
    @categories = InventoryApi.get_all("categories")
  end
end
