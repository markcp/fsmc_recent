require 'spec_helper'

describe Movie do

  before { @movie = Movie.new(title: "The Loneliest Planet",
                              year: "2011",
                              skandies_year: "2012",
                              director: "Julia Loktev",
                              title_index: "Loneliest Planet, The",
                              short: false) }

  subject { @movie }

  it { should respond_to(:title) }
  it { should respond_to(:year) }
  it { should respond_to(:skandies_year) }
  it { should respond_to(:director) }
  it { should respond_to(:title_index) }
  it { should respond_to(:short) }
  it { should respond_to(:viewings) }

  it { should be_valid }

  describe "when title is not present" do
    before { @movie.title = " " }
    it { should_not be_valid }
  end

  describe "when year is not present" do
    before { @movie.year = " " }
    it { should_not be_valid }
  end

  describe "when year is not numeric" do
    before { @movie.year = "abc" }
    it { should_not be_valid }
  end

  describe "when skandies_year is not numeric" do
    before { @movie.skandies_year = "abc" }
    it { should_not be_valid }
  end

  describe "when director is not present" do
    before { @movie.director = " " }
    it { should_not be_valid }
  end

  describe "when title_index is not present" do
    before { @movie.title_index = " " }
    it { should_not be_valid }
  end

  describe "when short is not present" do
    before { @movie.short = nil }
    it { should_not be_valid }
  end
end
