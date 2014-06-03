# gschool

Group management for turing (or whatever, really).
Currently it's called gschool, because we renamed the project but haven't messed with the gem yet.

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

### Project Teams

Add project teams to the `lib/data/gschool1.yml` file.

Generate new project teams with:

```ruby
puts GSchool.teams_of(3)
```

### 1-on-1 Lists

If there are 3 instructors available for 1-on-1s, this will create the groups,
and format them for the outline:

```ruby
n = 3
start_time = '14:00'
duration = 10 # minutes
puts GSchool.one_on_ones(n, start_time, duration)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
