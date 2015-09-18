$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)
require 'watir-ng'

Before { @browser = Watir::Browser.new }
After  { @browser.close }
