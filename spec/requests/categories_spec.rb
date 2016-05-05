require 'rails_helper'
require 'inventory_api'

describe "categories", type: :request do

  describe 'reading categories' do
    it "should render customers index page" do
      get '/categories'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
      expect(response.body).to include('categories')
    end
  end

  describe 'create new category' do
    let(:name){ "new category" }

    it "should render form to create category" do
      get '/categories/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template('new')
    end

    it "should create a new category with correct information" do
      visit '/categories/new'
      within(".category") do
        fill_in 'Name', :with => name
      end
      click_button 'Add Category'
      expect(page).to have_content name.capitalize
    end

    it "should render errors with incorrect information" do
      visit '/categories/new'
      click_button 'Add Category'
      expect(page).to have_content "can't be blank"
    end
  end

  # describe 'edit customers' do
  #   before do
  #     @customers = InventoryApi.get_all("customers")
  #   end

  #   it "should render form to edit customer" do
  #     get "/customers/#{@customers.last["id"].to_i}/edit"
  #     expect(response).to have_http_status(200)
  #     expect(response).to render_template('edit')
  #   end

  #   it "should update customers with correct information" do
  #     visit "/customers/#{@customers.last["id"].to_i}/edit"
  #     within(".customer") do
  #       fill_in 'Name', :with => "Adam"
  #     end
  #     click_button 'Edit Customer'
  #     expect(page).to have_content "Adam"
  #   end

  #   it "should render errors with incorrect information" do
  #     visit "/customers/#{@customers.last["id"].to_i}/edit"
  #     within(".customer") do
  #       fill_in 'Name', :with => ""
  #     end
  #     click_button 'Edit Customer'
  #     expect(page).to have_content "can't be blank"
  #   end
  # end

  # describe 'delete customers' do
  #   before do
  #     @customers = InventoryApi.get_all("customers")
  #   end

  #   it "should delete the customers" do
  #     visit "/customers"
  #     page.find(".customer_#{@customers.last["id"]}").click
  #     new_customers = InventoryApi.get_all("customers")
  #     expect(page).to have_content "Successfully delete customer"
  #     expect(new_customers.size).to eq(@customers.size - 1)
  #   end
  # end
end