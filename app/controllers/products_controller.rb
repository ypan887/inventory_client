class ProductsController < ApplicationController
  def new
  end

  def create
    response = InventoryApi.post_to_server("categories/#{product_params[:category_id]}/products", product_params)
    if response["errors"].nil?
      redirect_to categories_path 
    else
      error = response["errors"]
      redirect_to :back, :alert => error
    end
  end

  def edit
    categories = InventoryApi.get_all("categories")
    id = params[:id].to_i
    @current_product = []
    @categories_collection = categories.map do |a|
      m = (a["attributes"]["products"]).select{ |h| h["id"] == id }
      @current_product = m unless m.empty?
      [a["attributes"]["name"], a["id"]]
    end
  end

  def update
    response = InventoryApi.patch_to_server('products', product_params)
    if response["errors"].nil?
      redirect_to categories_path
    else
      error = response["errors"]
      redirect_to :back, :alert => error
    end
  end

  def destroy
    response = InventoryApi.delete_to_server('products', params)
    redirect_to categories_path, notice: "Successfully delete products"
  end

private

  def product_params
    params.require(:product).permit(:id, :category_id, :name, :price, :cost)
  end
end