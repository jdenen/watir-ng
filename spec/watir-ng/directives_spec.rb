require 'spec_helper'

describe WatirNg::Directives do
  describe "#ng" do
    it "returns an array" do
      expect(subject.ng).to be_an Array
    end
  end
  
  describe "#add_custom" do
    let(:base_class){ double "class" }

    it "returns an array of its arguments" do
      allow(Watir::HTMLElement).to receive(:attributes).and_return []
      expect(subject.add [:foo, :bar]).to eq [:foo, :bar]
    end

    it "patches custom directives onto Watir::HTMLElement" do
      attributes = double "[]"
      expect(Watir::HTMLElement).to receive(:attributes).twice.and_return attributes
      expect(attributes).to receive(:<<).with(:foo)
      expect(attributes).to receive(:<<).with(:bar)
      subject.add [:foo, :bar]
    end
  end
end
