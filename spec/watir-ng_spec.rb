require "spec_helper"

describe WatirNg do
  subject { WatirNg.dup }
  
  it "has a version number" do
    expect(subject::VERSION).to_not be_nil
  end

  describe ".directives" do
    it "returns an array of symbols" do
      expect(subject.directives).to be_an Array
      expect(subject.directives).to all(be_a Symbol)
    end
  end

  describe ".custom_directives" do
    it "returns an array" do
      expect(subject.custom_directives).to be_an Array
    end

    it "memoizes the array" do
      subject.custom_directives << :foo_bar
      expect(subject.custom_directives).to include(:foo_bar)
    end
  end

  describe ".register" do
    it "returns the subject class" do
      expect(subject.register :foo).to eq subject
    end

    it "adds its arguments to the custom directives array" do
      subject.register :foo
      expect(subject.custom_directives).to include(:foo)
    end
  end

  describe ".patch!" do
    let(:attributes){ double("array of attributes") }
    
    it "patches Watir::HTMLElement.attributes" do
      expect(Watir::HTMLElement).to receive(:attributes).and_return(attributes)
      expect(attributes).to receive(:push).with(*subject.directives)
      subject.patch!
    end

    it "patches custom directives onto the attributes" do
      dirs = subject.directives << :foo_bar
      expect(Watir::HTMLElement).to receive(:attributes).and_return(attributes)
      expect(attributes).to receive(:push).with(*dirs)
      subject.register :foo_bar
      subject.patch!
    end
  end
end
