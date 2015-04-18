require 'spec_helper'

describe WatirNg do
  it 'has a version number' do
    expect(WatirNg::VERSION).not_to be nil
  end

  context "when included in a class" do
    it "adds each ng directive to class.attributes" do
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to eq WatirNg::NG_DIRECTIVES
    end

    it "does not overwrite the class.attributes" do
      TestClass.attributes = [:foo]
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to eq [:foo] + WatirNg::NG_DIRECTIVES
    end
  end
end
