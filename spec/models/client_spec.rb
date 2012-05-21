require 'spec_helper'

describe Client do
  it "requires a name" do
    subject.save.should == false
    subject.errors.should have_key(:name)
  end
end
