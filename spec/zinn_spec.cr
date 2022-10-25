require "./spec_helper"

describe Terminal do
  describe "size" do
    it "correctly reports the number of elements in the Array" do
      [1, 2, 3].size.should eq 3
    end
  end
end
