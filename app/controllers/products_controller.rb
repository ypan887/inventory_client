class ProductsController < ApplicationController
  def new
  end

  def create
    response = InventoryApi.post_to_server("categories/#{product_params[:category_id]}/products", product_params)
    if response["errors"].nil?
      redirect_to categories_path 
    else
      error = (response["errors"].keys+response["errors"].values).join(" ")
      redirect_to :back, :notice => error
    end
  end

private

  def product_params
    params.require(:product).permit(:id, :category_id, :name, :price, :cost)
  end
end