class CustomersController < ApplicationController
  require 'inventory_api'

  def index
    @customers = InventoryApi.get_all("customers")
  end

  def new
  end

  def create
    response = InventoryApi.post_to_server('customers',customer_params)
    if response["errors"].nil?
      redirect_to customers_path   
    else
      error = response["errors"]
      redirect_to :back, :alert => error
    end
  end

  def edit
    @current_customer = InventoryApi.get_one("customers", params[:id])["attributes"]
  end

  def update
    response = InventoryApi.patch_to_server('customers', customer_params)
    if response["errors"].nil?
      redirect_to customers_path
    else
      error = response["errors"]
      redirect_to :back, :alert => error
    end
  end

  def destroy
    response = InventoryApi.delete_to_server('customers', params)
    redirect_to customers_path, notice: "Successfully delete customer"
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :address, :country, :zip, :photo_id)
  end

end
