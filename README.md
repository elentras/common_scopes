# CommonScopes

This gem will generate defaults scopes based on ActiveRecord's model and it's attributes types.

## Usage
```ruby
class Actor < ActiveRecord::Base
  include CommonScopes
end

actors = Actor.
  by_created_at_greater('2017-01-01').
  by_name_start('Jeremy').
  by_age_greater(30).
  by_age_lesser(40)
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'common_scopes'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install common_scopes
```

## Contributing
Any help would be appreciated ! Simple for and make a PR with your code !

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
