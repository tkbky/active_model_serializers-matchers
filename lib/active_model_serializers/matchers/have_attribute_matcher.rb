# frozen_string_literal: true
module ActiveModelSerializers
  module Matchers
    # rubocop:disable Style/PredicateName
    def have_attribute(name)
      HaveAttributeMatcher.new(name)
    end
    # rubocop:enable Style/PredicateName

    class HaveAttributeMatcher

      attr_accessor :name, :actual

      def initialize(name)
        @name = name
      end

      def matches?(actual)
        @actual = actual
        attributes.include?(name)
      end

      def description
        "have attribute #{name}"
      end

      def failure_message
        "Expected #{expectation}, but it did not"
      end

      def failure_message_when_negated
        "Did not expect #{expectation}, but it did"
      end

      protected

      def expectation
        "#{actual.inspect} to have an attribute called #{name}"
      end

      def serializer_class
        if actual.is_a?(Class)
          actual
        else
          actual.class
        end
      end

      def attributes
        serializer_class._attributes
      end

    end
  end
end
