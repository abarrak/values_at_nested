# Values At Nested
[![Gem Version](https://badge.fury.io/rb/values_at_nested.svg)](https://rubygems.org/gems/values_at_nested)
[![Build Status](https://travis-ci.org/abarrak/values_at_nested.svg?branch=master)](https://travis-ci.org/abarrak/values_at_nested)
[![Test Coverage](https://codeclimate.com/github/abarrak/values_at_nested/badges/coverage.svg)](https://codeclimate.com/github/abarrak/values_at_nested/coverage)

`values_at_nested` allows extraction of hash values at various depth of the hash.

It's an extended version of ruby's `#values_at` hash method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'values_at_nested'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install values_at_nested
```

## Usage

Given the following hash:

```ruby
h = { name: 'Zohoor', degree: 'Psychology', preferences: { color: 'mauve', pet: 'cat' } }
```

You can deep extract values:

```ruby
```

Or extrac values in the first level just like normal `#values_at` does:

```ruby
h.values_at_nested(:name)
=> ['Zohoor']

h.values_at_nested(:name, :degree)
=> ['Zohoor', 'Psychology']

h.values_at_nested(:name, :degree, :preferences)
=> ['Zohoor', 'Psychology', ['mauve', 'cat']]
```

It works for any nested levels. Check [test case]() for 3-level depth example.

## Documentation

[RDoc version](http://www.rubydoc.info/gems/values_at_nested) at RubyDoc.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. 

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
  
Bug reports and pull requests are welcome on [GitHub](https://github.com/abarrak/values_at_nested).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
