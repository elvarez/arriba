describe Vote do
  describe "valudations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        [1, -1].should include Vote.new.value 
      end
    end
  end
end
