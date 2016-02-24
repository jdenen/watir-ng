$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)
require 'watir-ng'

Before { WatirNg.register(:ng_custom).patch! }
After  { @browser.close }
