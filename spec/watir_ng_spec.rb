require 'spec_helper'

describe WatirNg do
  let(:directives){ WatirNg::NG_STRINGS.map(&:to_sym) }
  
  it 'has a version number' do
    expect(WatirNg::VERSION).not_to be nil
  end

  describe "#custom_directives" do
    it "returns an array" do
      expect(WatirNg.custom_directives).to eq []
    end
  end

  context "when included on a class" do
    it "adds each ng directive to class.attributes" do
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to eq directives
    end

    it "does not overwrite the class.attributes" do
      TestClass.attributes = [:foo]
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to include(:foo)
      expect(TestClass.attributes).to include(*directives)
    end

    it "includes custom directives when configured" do
      WatirNg.custom_directives << :ng_foo_bar
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to include(:ng_foo_bar)
    end
  end
end
