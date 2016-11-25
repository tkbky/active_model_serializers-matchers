# frozen_string_literal: true
require 'spec_helper'

RSpec.describe ActiveModelSerializers::Matchers::HaveAttributeMatcher do

  context 'when it is a serializer class' do

    subject { Class.new(ActiveModel::Serializer) { attributes :foo } }

    it_behaves_like 'it have attribute :foo'

  end

  context 'when it is a serializer instance' do

    class FooSerializer < ActiveModel::Serializer; attributes :foo; end

    subject { FooSerializer.new(nil) }

    it_behaves_like 'it have attribute :foo'

  end

end
