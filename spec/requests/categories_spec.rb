require 'rails_helper'
require 'inventory_api'

describe "categories", type: :request do

  describe 'reading categories' do
    it "should render categories index page" do
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

  describe 'edit categories' do
    before do
      @categories = InventoryApi.get_all("categories")
    end

    it "should render form to edit categories" do
      get "/categories/#{@categories.last["id"].to_i}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template('edit')
    end

    it "should update categories with correct information" do
      visit "/categories/#{@categories.last["id"].to_i}/edit"
      within(".category") do
        fill_in 'Name', :with => "changed category"
      end
      click_button 'Edit Category'
      expect(page).to have_content "Changed category"
    end

    it "should render errors with incorrect information" do
      visit "/categories/#{@categories.last["id"].to_i}/edit"
      within(".category") do
        fill_in 'Name', :with => ""
      end
      click_button 'Edit Category'
      expect(page).to have_content "can't be blank"
    end
  end

  describe 'delete categories' do
    before do
      @categories = InventoryApi.get_all("categories")
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