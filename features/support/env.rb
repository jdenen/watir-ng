$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)
require 'watir-ng'

Before do
  @browser = Watir::Browser.new
end

After do
  @browser.close
end
