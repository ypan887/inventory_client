require 'rails_helper'
require 'inventory_api'

describe "products", type: :request do

  describe 'create new prodcut' do
    let(:category_name){ "new category" }
    let(:name){ "product1" }
    let(:price){ 20 }
    let(:cost){ 10 }

    before do
      InventoryApi.post_to_server('customers', ActionController::Parameters.new({ category: { name: category_name}}))
      @categories = InventoryApi.get_all("categories")
    end

    it "should create a new product with correct information" do
      visit "/categories/#{@categories.last["id"].to_i}/products/new"
      within(".product") do
        fill_in 'Name', :with => name
        fill_in 'Price', :with => price
        fill_in 'Cost', :with => cost
      end
      click_button 'Add Product'
      expect(page).to have_content name
    end

  describe 'delete product' do
    before do
      @products = InventoryApi.get_all("products")
    end

    it "should delete the categories" do
      visit "/categories"
      page.find(".category_#{@categories.last["id"]}").click
      new_categories = InventoryApi.get_all("categories")
      expect(page).to have_content "Successfully delete category"
      expect(new_categories.size).to eq(@categories.size - 1)
    end
  end
    
  end
end