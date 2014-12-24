# CapVRM

This is a simple gem to get VRM details from CAP's DVLA lookup web service. You need to have a commercial relationship with them to use it, see http://cap.co.uk to contact them.

## Installation

Add this line to your application's Gemfile:

    gem 'CapVRM'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install CapVRM

## Usage

```require 'rubygems'
require 'CapVRM'

CapVRM.config username: 'account', password: 'password'

car_details = CapVRM.new vrm: 'MV07 XXX'

car_details.found? # true/false

car_details.make # Vauxhall (maybe)
car_details.manufacturer # Zafira

### More to follow

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/CapVRM/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

