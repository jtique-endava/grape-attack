# Grape::Attack <sup>*forked central edition*</sup>

A forked version of the [Grape::Attack](https://github.com/gottfrois/grape-attack) middleware focused on global throttling.

If you're feeling saucy, you can still override the global defaults with endpoint-specific throttling.

## Why Do This?

It's [Rack::Attack](https://github.com/kickstarter/rack-attack) for [Grape](https://github.com/ruby-grape/grape). That's great! But there was a need for global throttling as the default. Like its ancestor, this fork is meant to be dead simple with minimal configuration.

There's a DSL to throttle your Grape API endpoints that works a lot like [Wine Bouncer](https://github.com/nschneble/wine_bouncer).

## Getting Started

Read up on Grape::Attack's [installation](https://github.com/gottfrois/grape-attack#installation) and [default usage](https://github.com/gottfrois/grape-attack#usage).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "grape-attack", github: "nschneble/grape-attack"
```

Then execute:

    $ bundle install

## Usage

Mount the middleware in your API:

```ruby
class MyApi < Grape::API
  use Grape::Attack::Throttle
end
```

Define global throttling in an initializer (defaults below):

```ruby
# config/initializers/grape_attack.rb

Grape::Attack.configure do |config|
  config.throttle_limit = 600
  config.throttle_interval = 1.hour
end
```

Then enable for your Grape endpoints using the `throttle` DSL:

```ruby
class MyApi < Grape::API
  use Grape::Attack::Throttle

  resources :contacts do
    throttle
    get do
      Contact.all
    end
  end
end
```

You can override the global defaults for individual endpoints:

```ruby
class MyApi < Grape::API
  use Grape::Attack::Throttle

  resources :contacts do
    throttle limit: 10, per: 1.minute
    get do
      Contact.all
    end
  end
end
```

## More Information

Refer to [Grape::Attack](https://github.com/gottfrois/grape-attack) for information on how exceptions are raised, expected HTTP responses, and more.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

