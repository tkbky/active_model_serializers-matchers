# frozen_string_literal: true
shared_examples 'it have attribute :foo' do

  it { expect(subject).to have_attribute(:foo) }
  it { expect(subject).not_to have_attribute(:bar) }

  describe '#description' do

    let(:expectation) { have_attribute(:foo) }

    before { expect(subject).to expectation }

    it { expect(expectation.description).to eq('have attribute foo') }

  end

  describe '#failure_message' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have an attribute called bar, but it did not"

    end

    it do

      expect { expect(subject).to have_attribute(:bar) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe '#negated_failure_message' do

    let(:negated_failure_message) do

      "Did not expect #{subject.inspect} to have an attribute called foo, but it did"

    end

    it do

      expect { expect(subject).not_to have_attribute(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, negated_failure_message
      )

    end

  end

end

shared_examples 'it belongs_to :foo' do

  it { expect(subject).to belong_to(:foo) }
  it { expect(subject).not_to belong_to(:bar) }
  it { expect(belong_to(:foo).description).to eq('belongs_to foo') }

  describe 'fail with belong_to :bar expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a belongs_to association called bar, but it did not"

    end

    it do

      expect { expect(subject).to belong_to(:bar) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with have_many :foo expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a has_many association called foo (actual association type was belongs_to), but it did not"

    end

    it do

      expect { expect(subject).to have_many(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with have_one :foo expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a has_one association called foo (actual association type was belongs_to), but it did not"

    end

    it do

      expect { expect(subject).to have_one(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with not belong_to :foo expectation' do

    let(:negated_failure_message) do

      "Did not expect #{subject.inspect} to have a belongs_to association called foo, but it did"

    end

    it do

      expect { expect(subject).not_to belong_to(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, negated_failure_message
      )

    end

  end

end

shared_examples 'it has_many :foo' do

  it { expect(subject).to have_many(:foo) }
  it { expect(subject).not_to have_many(:bar) }
  it { expect(have_many(:foo).description).to eq('has_many foo') }

  describe 'fail with have_many :bar expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a has_many association called bar, but it did not"

    end

    it do

      expect { expect(subject).to have_many(:bar) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with belong_to :foo expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a belongs_to association called foo (actual association type was has_many), but it did not"

    end

    it do

      expect { expect(subject).to belong_to(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with have_one :foo expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a has_one association called foo (actual association type was has_many), but it did not"

    end

    it do

      expect { expect(subject).to have_one(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with not have_many :foo expectation' do

    let(:negated_failure_message) do

      "Did not expect #{subject.inspect} to have a has_many association called foo, but it did"

    end

    it do

      expect { expect(subject).not_to have_many(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, negated_failure_message
      )

    end

  end

end

shared_examples 'it has_one :foo' do

  it { expect(subject).to have_one(:foo) }
  it { expect(subject).not_to have_one(:bar) }
  it { expect(have_one(:foo).description).to eq('has_one foo') }

  describe 'fail with have_one :bar expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a has_one association called bar, but it did not"

    end

    it do

      expect { expect(subject).to have_one(:bar) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with belong_to :foo expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a belongs_to association called foo (actual association type was has_one), but it did not"

    end

    it do

      expect { expect(subject).to belong_to(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with have_many :foo expectation' do

    let(:failure_message) do

      "Expected #{subject.inspect} to have a has_many association called foo (actual association type was has_one), but it did not"

    end

    it do

      expect { expect(subject).to have_many(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, failure_message
      )

    end

  end

  describe 'fail with not have_one :foo expectation' do

    let(:negated_failure_message) do

      "Did not expect #{subject.inspect} to have a has_one association called foo, but it did"

    end

    it do

      expect { expect(subject).not_to have_one(:foo) }.to raise_error(
        RSpec::Expectations::ExpectationNotMetError, negated_failure_message
      )

    end

  end

end
