require 'spec_helper'

describe "Viewing Pages" do

  subject { page }

  before { @format = FactoryGirl.create(:format) }
  before { @movie = FactoryGirl.create(:movie) }

  describe "new viewing page" do
    before { visit new_viewing_path }

    it { should have_selector('h1', text: 'New viewing') }
    it { should have_title('New viewing') }
  end

  describe "Add a viewing" do

    before { visit new_viewing_path }

    let(:submit) { "Create Viewing" }

    describe "with invalid information" do
      it "should not create a viewing" do
        expect { click_button submit }.not_to change(Viewing, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('New viewing') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Movie", with: "1"
        fill_in "Date", with: "2013-07-04"
        select  "Blu-ray", from: "Format"
        fill_in "Rating", with: "81"
        fill_in "Notes", with: "Example note"
      end

      it "should create a viewing" do
        expect { click_button submit }.to change(Viewing, :count)
      end

      describe "after saving the viewing" do
        before { click_button submit }

        it { should have_title('Viewings') }
        it { should have_selector('div.alert.alert-success', text: 'Viewing added.') }
      end
    end
  end
end
