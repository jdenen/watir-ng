$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)
require 'watir-ng'

Before('~@configuration') do
  @browser = Watir::Browser.new
end

Before('@configuration') do
  WatirNg.custom_directives << :ng_foo
  @browser = Watir::Browser.new
end

After do
  @browser.close
end
