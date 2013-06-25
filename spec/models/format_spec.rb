require 'spec_helper'

describe Format do

  before { @format = Format.new( name: 'Blu-ray disc') }

  subject { @format }

  it { should respond_to(:name) }
  it { should respond_to(:viewings) }

  describe "when name is not present" do
    before { @format.name = " " }
    it { should_not be_valid }
  end
end
