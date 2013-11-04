# gschool

Group management for gSchool.

## Installation

Add this line to your application's Gemfile:

    gem 'gschool'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gschool

## Usage

### Randomized Students for Retrospectives

```ruby
retro = GSchool.discuss

retro.next
# => "John Doe"
retro.next
# => "Alice Smith"
```

### 1-on-1 Lists

If there are 3 instructors available for 1-on-1s, this will create the groups,
and format them for the outline:

```ruby
puts GSchool.md(GSchool::One.groups(3))
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
