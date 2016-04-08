class CustomersController < ApplicationController
  require 'inventory_api'

  def index
    @customers = InventoryApi.get_all("customers")
  end

  def new
  end

  def create
    response = InventoryApi.post_to_server(customer_params)
    if response["errors"].nil?
      redirect_to customers_path    #This statement is important
    else
      error = (response["errors"].keys+response["errors"].values).join(" ")
      redirect_to :back, :notice => error
    end
  end

  def edit
  end

  def update
    response = InventoryApi.patch_to_server(customer_params)
    if response["errors"].nil?
      redirect_to customers_path    #This statement is important
    else
      error = (response["errors"].keys+response["errors"].values).join(" ")
      redirect_to :back, :notice => error
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :address, :country, :zip, :photo_id)
  end

end
