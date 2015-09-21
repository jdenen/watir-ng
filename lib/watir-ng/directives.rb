module WatirNg
  
  #
  # Object that stores ng directives and patches custom directives onto Watir::HTMLElement.
  #
  class Directives
    
    #
    # Returns array of ng directives.
    #
    # @return [Array<String>]
    #
    def ng
      %w(ng_jq ng_app ng_href ng_src ng_srcset ng_disabled ng_checked ng_readonly 
         ng_selected ng_open ng_form ng_value ng_bind ng_bind_template ng_bind_html 
         ng_change ng_class ng_class_odd ng_class_even ng_cloak ng_controller ng_csp 
         ng_click ng_dblclick ng_mousedown ng_mouseup ng_mouseover ng_mouseenter 
         ng_mouseleave ng_mousemove ng_keydown ng_keyup ng_keypress ng_submit ng_focus
         ng_blur ng_copy ng_cut ng_paste ng_if ng_include ng_init ng_list ng_model 
         ng_model_options ng_non_bindable ng_options ng_pluralize ng_repeat ng_show 
         ng_hide ng_style ng_switch ng_transclude)
    end
    
    #
    # Patches each element in an array onto `Watir::HTMLElement.attributes`.
    #
    # @param directives [Array] identifiers to be patched onto HTMLElement
    # @return [Array]
    #
    # @see Watir::HTMLElement
    #
    def add directives
      directives.tap do |array|
        array.each { |custom| Watir::HTMLElement.attributes << custom }
      end
    end
  end
end
