# watir-ng
[![Gem Version](https://badge.fury.io/rb/watir-ng.svg)](http://badge.fury.io/rb/watir-ng)
[![Build Status](https://travis-ci.org/jdenen/watir-ng.svg?branch=master)](https://travis-ci.org/jdenen/watir-ng)

Identify [watir-webdriver](http://github.com/watir/watir-webdriver) elements with AngularJS [ng](https://docs.angularjs.org/api/ng/directive) directives.

## Usage

When identifying elements, use the `ng` directives like you would `id`, `class`, etc. Be sure to use underscores instead of dashes though!

```ruby
# To find and click this HTML element:
#     <button ng-click="foo">Submit</button>

submit_button = @browser.button(ng_click: "foo")
submit_button.click
```

To ensure your browser objects have access to the ng identifiers, run `patch!` before instantiating. 

```ruby
require 'watir-ng'

WatirNg.patch!

@browser = Watir::Browser.new
```

You can identify elements with custom directives by registering them before patching the browser. 

```ruby
require 'watir-ng'

WatirNg.register(:ng_foo, :ng_bar).patch!

@browser = Watir::Browser.new
```

## Installation

Add this line to your application's Gemfile:

    gem 'watir-ng'

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install watir-ng

## Contributing

1. Fork it ( http://github.com/jdenen/watir-ng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Questions, Comments, Concerns

Find me on Twitter ([@jpdenen](http://twitter.com/jpdenen)), gitter ([@jdenen](http://gitter.im/jdenen)) or write up an [issue](https://github.com/jdenen/watir-ng/issues/new).

