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

    it "should render errors with incorrect information" do
      visit "/categories/#{@categories.last["id"].to_i}/products/new"
      click_button 'Add Product'
      expect(page).to have_content "can't be blank"
    end
  end

  describe 'edit products' do
    before do
      @products = InventoryApi.get_all("categories").inject([]){|a, h| a << h["attributes"]["products"]}.flatten.sort_by{|h| h["id"]}
    end

    it "should render form to edit categories" do
      get "/products/#{@products.last['id']}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template('edit')
    end

    it "should update products with correct information" do
      visit "/products/#{@products.last['id']}/edit"
      within(".product") do
        fill_in 'Name', :with => "edited product"
      end
      click_button 'Edit Product'
      expect(page).to have_content "edited product"
    end

    it "should render errors with incorrect information" do
      visit "/products/#{@products.last['id']}/edit"
      within(".product") do
        fill_in 'Name', :with => ""
      end
      click_button 'Edit Product'
      expect(page).to have_content "can't be blank"
    end
  end

  describe 'delete product' do
    before do
      @products = InventoryApi.get_all("categories").inject([]){|a, h| a << h["attributes"]["products"]}.flatten.sort_by{|h| h["id"]}
    end

    it "should delete the categories" do
      visit "/categories"
      page.find(".products_#{@products.last["id"]}").click
      expect(page).to have_content "Successfully delete product"
      new_products = InventoryApi.get_all("categories").inject([]){|a, h| a << h["attributes"]["products"]}.flatten
      expect(new_products.size).to eq(@products.size - 1)
    end
  end
end