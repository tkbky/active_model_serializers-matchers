# ActiveModelSerializers::Matchers

One-liners RSpec matchers for ActiveModelSerializers.

## Requirements

Only ActiveModelSerializers **0.10.0** is supported

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_model_serializers-matchers', group: :test
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_model_serializers-matchers

## Usage

```ruby
# app/serializers/user_serializer.rb

class UserSerializer < ActiveModel::Serializer
  attribute :email
  has_many :orders, serializer: OrderSerializer
  have_one :profile, serializer: ProfileSerializer
end
```

```ruby
class ProfileSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: UserSerializer
end
```

```ruby
# app/serializers/order_serializer.rb

class OrderSerializer < ActiveModel::Serializer
  attributes :amount
  belongs_to :user, serializer: UserSerializer
end
```

```ruby
# spec/serializers/user_serializer.rb

RSpec.describe UserSerializer do
  it { is_expected.to have_attribute(:email) }
  it { is_expected.to have_many(:orders).serializer(OrderSerializer) }
  it { is_expected.to have_one(:profile).serializer(ProfileSerializer) }
end
```

```ruby
# spec/serializers/profile_serializer.rb

RSpec.describe ProfileSerializer do
  it { is_expected.to belong_to(:user).serializer(UserSerializer) }
end
```

```ruby
# spec/serializers/order_serializer.rb

RSpec.describe OrderSerializer do
  it { is_expected.to have_attribute(:amount) }
  it { is_expected.to belong_to(:user).serializer(UserSerializer) }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_model_serializers-matchers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
