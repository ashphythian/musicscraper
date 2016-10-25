# Musicscraper

This gem provides hashes of new music. It currently scrapes Boomkat's New &
Recommended, Fact's Mixes & Pitchfork's Best New. The Boomkat module provides
functionality for genre filtering.

This has been produced with the intention of making a Slack slash command
integration, with the aim of speeding up music selection/browsing.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'musicscraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install musicscraper

## Usage

### Boomkat:

To list all the recommended new releases:
```
 Musicscraper.boomkat_all
```

To list a specific genre:
```
Musiscraper.boomkat_all('Hip-Hop')
```
(The genre list can be found in `lib/musiscraper/boomkat/recommended_new.rb`

### Fact:

To list all the current mixes:
```
Musiscraper.fact_list
```

### Pitchfork:

To list all of Pitchfork's Best New:
```
Musicscraper.pitchfork_all
```

To list a specific format:
```
Musiscraper.pitchfork_albums
Musiscraper.pitchfork_tracks
Musiscraper.pitchfork_reissues
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/musicscraper.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

