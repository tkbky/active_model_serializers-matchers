# frozen_string_literal: true
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_model_serializers'
require 'active_model_serializers/matchers'
require 'support/shared_examples'

module ExampleGroup
  extend ActiveSupport::Concern
  include ActiveModelSerializers::Matchers

  included do

    subject { described_class }
    metadata[:type] = :serializer

  end
end

RSpec.configure do |config|

  config.include ExampleGroup

end
