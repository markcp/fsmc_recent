require 'spec_helper'

describe Movie do

  before { @movie = Movie.new(title: "The Loneliest Planet",
                              year: "2011",
                              skandies_year: "2012",
                              director: "Julia Loktev",
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

  describe "when short is not present" do
    before { @movie.short = nil }
    it { should_not be_valid }
  end

  describe "title_index" do

    describe "when title doesn't start with an article" do
      before do
        @movie.title = "Moonrise Kingdom"
        @movie.save
      end
      its(:title_index) { should == "Moonrise Kingdom" }
    end

    describe "when title starts with 'the'" do
      before do
        @movie.title = "The Loneliest Planet"
        @movie.save
      end
      its(:title_index) { should == "Loneliest Planet, The"}
    end

    describe "when title starts with 'a'" do
      before do
        @movie.title = "A Separation"
        @movie.save
      end
      its(:title_index) { should == "Separation, A" }
    end

    describe "when title starts with 'an'" do
      before do
        @movie.title = "An Education"
        @movie.save
      end
      its(:title_index) { should == "Education, An"}
    end

    describe "title with two articles" do
      before do
        @movie.title = "The Squid and the Whale"
        @movie.save
        its(:title_index) { should == "Squid and the Whale, The"}
      end
    end
  end
end
