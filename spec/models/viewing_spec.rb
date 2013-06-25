require 'spec_helper'

describe Viewing do

  let(:format) { FactoryGirl.create(:format) }
  before { @viewing = format.viewings.build(movie_id: 1,
                                            date: '2013-06-18',
                                            rating: 80,
                                            notes: 'Example note.') }

  subject { @viewing }

  it { should respond_to(:movie_id) }
  it { should respond_to(:date) }
  it { should respond_to(:format_id) }
  it { should respond_to(:rating) }
  it { should respond_to(:notes) }
  it { should respond_to(:format) }
  its(:format) { should eq format }

  describe "when movie_id is not present" do
    before { @viewing.movie_id = nil }
    it { should_not be_valid }
  end

  describe "when format_id is not present" do
    before { @viewing.format_id = nil }
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { @viewing.date = "" }
    it { should_not be_valid }
  end

  describe "when rating is not numeric" do
    before { @viewing.rating = "a1" }
    it { should_not be_valid }
  end

  describe "when rating is below 1" do
    before { @viewing.rating = 0 }
    it { should_not be_valid }
  end

  describe "when rating is above 100" do
    before { @viewing.rating = 101 }
    it { should_not be_valid }
  end
end
