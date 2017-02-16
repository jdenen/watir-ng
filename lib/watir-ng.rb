require 'watir'
require 'watir-ng/version'

#
# Adds AngularJS `ng` directives as identifiers for `Watir::Webdriver` elements.
#
module WatirNg
  class << self
    
    #
    # Register custom directives as element identifiers.
    #
    # @example
    #   WatirNg.register "ng_foo", :ng_bar
    #
    # @param custom_directives [Symbol, String]
    # @return [WatirNg]
    #
    def register *args
      tap { |ng| ng.custom_directives.push *args }
    end

    #
    # Patch Watir::HTMLElements with ng and custom directives.
    #
    # @example
    #   require 'watir-webdriver'
    #   require 'watir-ng'
    #   WatirNg.patch!
    #   browser = Watir::Browser.start
    #
    # @return [Array]
    #
    def patch!
      attributes = directives.push *custom_directives.map(&:to_sym)
      Watir::HTMLElement.attributes.push *attributes
    end

    # @api private
    #
    # Return array of ng directives.
    #
    # @return [Array<Symbol>]
    #
    def directives
      %w(ng_jq ng_app ng_href ng_src ng_srcset ng_disabled ng_checked ng_readonly 
         ng_selected ng_open ng_form ng_value ng_bind ng_bind_template ng_bind_html 
         ng_change ng_class ng_class_odd ng_class_even ng_cloak ng_controller ng_csp 
         ng_click ng_dblclick ng_mousedown ng_mouseup ng_mouseover ng_mouseenter 
         ng_mouseleave ng_mousemove ng_keydown ng_keyup ng_keypress ng_submit ng_focus
         ng_blur ng_copy ng_cut ng_paste ng_if ng_include ng_init ng_list ng_model 
         ng_model_options ng_non_bindable ng_options ng_pluralize ng_repeat ng_show 
         ng_hide ng_style ng_switch ng_transclude).map(&:to_sym)
    end

    # @api private
    #
    # Return array of custom directives.
    #
    # @return [Array]
    #
    def custom_directives
      @custom_directives ||= []
    end
    
  end
end
