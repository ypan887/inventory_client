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
    # it "should craete product" do
    #   get '/categories/new'
    #   expect(response).to have_http_status(200)
    #   expect(response).to render_template('new')
    # end

    it "should create a new category with correct information" do
      visit "/categories/#{@categories.last["id"].to_i}/products/new"
      within(".product") do
        fill_in 'Name', :with => name
        fill_in 'Price', :with => price
        fill_in 'Cost', :with => cost
      end
      click_button 'Add Product'
      expect(page).to have_content name
    end

    # it "should render errors with incorrect information" do
    #   visit '/categories/new'
    #   click_button 'Add Category'
    #   expect(page).to have_content "can't be blank"
    # end
  end
end