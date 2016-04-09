require 'rails_helper'

describe "Static pages", type: :request do

  describe 'render homepage' do
    it "should render homepage with background" do
      visit '/'
      expect(page).to have_selector("body#body_homepage")
    end
  end
end