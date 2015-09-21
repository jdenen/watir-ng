require 'spec_helper'

describe WatirNg do
  it 'has a version number' do
    expect(WatirNg::VERSION).not_to be nil
  end

  describe ".directives" do
    it "returns a Directives object" do
      expect(WatirNg.directives).to be_a WatirNg::Directives
    end

    it "memoizes the Directives object" do
      expect(WatirNg.directives).to eq WatirNg.directives
    end
  end

  context "when included on a class" do
    let(:ng){ WatirNg::Directives.new.ng }
    
    it "patches ng directives onto Class.attributes" do
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to eq ng
    end

    it "does not overwrite the Class.attributes" do
      TestClass.attributes = [:foo]
      TestClass.send(:include, WatirNg)
      expect(TestClass.attributes).to include(:foo)
      expect(TestClass.attributes).to include(*ng)
    end
  end

  describe ".register" do
    let(:dir_obj){ double "WatirNg::Directives"}
    before do
      expect(subject).to receive(:directives).and_return dir_obj
      expect(dir_obj).to receive(:add).with [:foobar, :foobaz]
    end
    
    it "passes custom attributes on as an array" do
      subject.register :foobar, :foobaz
    end

    it "maps its arguments to symbols" do
      subject.register "foobar", "foobaz"
    end
  end
end
