# frozen_string_literal: true
require 'spec_helper'

RSpec.describe ActiveModelSerializers::Matchers::AssociationMatcher do

  context 'when given serializer is a class & it belongs_to :foo' do

    subject { Class.new(ActiveModel::Serializer) { belongs_to :foo } }

    it_behaves_like 'it belongs_to :foo'

  end

  context 'when given serializer is an instance & it belongs_to :foo' do

    class FooSerializer < ActiveModel::Serializer; belongs_to :foo; end

    subject { FooSerializer.new(nil) }

    it_behaves_like 'it belongs_to :foo'

  end

  context 'when given serializer belongs_to :foo serialize with FooSerializer' do

    class FooSerializer < ActiveModel::Serializer; end
    class BarSerializer < ActiveModel::Serializer; end

    subject do

      Class.new(ActiveModel::Serializer) do

        belongs_to :foo, serializer: FooSerializer

      end

    end

    it_behaves_like 'it belongs_to :foo'

    describe 'fail with belong_to :bar serializer BarSerializer expectation' do

      let(:negated_failure_message) do

        "Expected #{subject} to have a belongs_to association called foo (foo should be serialize with FooSerializer), but it did not"

      end

      it do

        expect { expect(subject).to belong_to(:foo).serializer(BarSerializer) }
          .to raise_error(
            RSpec::Expectations::ExpectationNotMetError, negated_failure_message
          )

      end

    end

  end

  context 'when given serializer has_many :foo' do

    subject { Class.new(ActiveModel::Serializer) { has_many :foo } }

    it_behaves_like 'it has_many :foo'

  end

  context 'when given serializer has_many :foo serialize with FooSerializer' do

    class FooSerializer < ActiveModel::Serializer; end
    class BarSerializer < ActiveModel::Serializer; end

    subject do

      Class.new(ActiveModel::Serializer) do

        has_many :foo, serializer: FooSerializer

      end

    end

    it_behaves_like 'it has_many :foo'

    describe 'fail with have_many :bar serializer BarSerializer expectation' do

      let(:negated_failure_message) do

        "Expected #{subject} to have a has_many association called foo (foo should be serialize with FooSerializer), but it did not"

      end

      it do

        expect { expect(subject).to have_many(:foo).serializer(BarSerializer) }
          .to raise_error(
            RSpec::Expectations::ExpectationNotMetError, negated_failure_message
          )

      end

    end

  end

  context 'when given serializer has_many :foo' do

    subject { Class.new(ActiveModel::Serializer) { has_one :foo } }

    it_behaves_like 'it has_one :foo'

  end

  context 'when given serializer has_one :foo serialize with FooSerializer' do

    class FooSerializer < ActiveModel::Serializer; end
    class BarSerializer < ActiveModel::Serializer; end

    subject do

      Class.new(ActiveModel::Serializer) do

        has_one :foo, serializer: FooSerializer

      end

    end

    it_behaves_like 'it has_one :foo'

    describe 'fail with have_one :bar serializer BarSerializer expectation' do

      let(:negated_failure_message) do

        "Expected #{subject} to have a has_one association called foo (foo should be serialize with FooSerializer), but it did not"

      end

      it do

        expect { expect(subject).to have_one(:foo).serializer(BarSerializer) }
          .to raise_error(
            RSpec::Expectations::ExpectationNotMetError, negated_failure_message
          )

      end

    end

  end

end
