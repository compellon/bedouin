# Bedouin

Bedouin is a tool for templatizing job files for Hashicorp Nomad.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bedouin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bedouin

## Usage

Create one or more environment files and one or more ERB job templates, and then execute:

    $ bedouin <environment file> <template1> <template2> ...

Bedouin will evaluate each template with any attributes from the environment file available as instance variables. Bedouin will then run the results of each with "nomad run".

### Environment Files

Environment files should contain any environment-specific information needed to templatize the Nomad job definitions.

In the file myname.rb
```ruby
environment "myname" do |e|
  e.foo = "bar"
end
```

This would make an environment file which injects the value "bar" for @foo in any template files. @name is also available with the value "myname".

Environments are also able to inherit from other environments. Simply specify the path of the parent environment file as a second argument to the environment method:

In the file mydir/mychild.rb
```ruby
environment "mychild", "../myname.rb" do |e|
  e.bar = "baz"
end
```

As these files are pure ruby, there is a vast amount of possibilities for how to use them. All they must do is return an object which converts to a Hash.

### Template Files

Template files are just ERuby files that output a valid nomad job file. For information about ERuby, see https://en.wikipedia.org/wiki/ERuby.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/compellon/bedouin.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

