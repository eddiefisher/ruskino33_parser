# Ruskino33Parser

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruskino33_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruskino33_parser

## Usage

### Get anonce on this day
```ruby
anonce = Ruskino33Parser::Anonce.new
```

### Get anonce on next day
```ruby
anonce = Ruskino33Parser::Anonce.new Date.today + 10.days
```

### Get object of movies
```ruby
anonce.movies
```

### Get movie title
```ruby
anonce.movies.first.title
```

### Get movie schedules
```ruby
anonce.movies.first.schedules
```

### Get movie other_days
```ruby
anonce.movies.first.other_days
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruskino33_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
