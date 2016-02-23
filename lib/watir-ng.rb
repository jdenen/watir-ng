require "watir-webdriver"
require "watir-ng/directives"
require "watir-ng/version"

#
# Adds AngularJS `ng` directives as identifiers for `Watir::Webdriver` elements.
#
module WatirNg
  class << self
    #
    # Patch ng directives onto the array returned by `BaseClass.attributes`.
    #
    # @param cls [Class] base class
    # @return [nil]
    #
    def included cls
      cls.attributes.push *directives.ng.map(&:to_sym)
    end

    #
    # Return directive collection object.
    #
    # @return [WatirNg::Directives]
    #
    def directives
      @directives ||= Directives.new
    end

    #
    # Register custom directives to be patched onto the base class attributes array.
    #
    # @param custom_directives [Symbol, String]
    # @return [Array<Symbol>]
    #
    def register *custom_directives
      directives.add custom_directives.map(&:to_sym)
    end
  end
end

module Watir
  class HTMLElement
    include WatirNg
  end
end
