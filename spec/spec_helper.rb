$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'watir-ng'

class TestClass
  def self.attributes
    @attributes ||= []
  end

  def self.attributes=(array)
    @attributes = array
  end
end
