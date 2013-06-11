require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Fireman Save My Child" }

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end


  describe "Links page" do

    it "should have the content 'Links'" do
      visit '/static_pages/links'
      expect(page).to have_content('Links')
    end

    it "should have the title 'Links'" do
      visit '/static_pages/links'
      expect(page).to have_title("#{base_title} | Links")
    end
  end
end
