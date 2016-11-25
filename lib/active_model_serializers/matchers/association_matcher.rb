# frozen_string_literal: true
module ActiveModelSerializers
  module Matchers
    # rubocop:disable Style/PredicateName
    def have_many(name)
      AssociationMatcher.new(:has_many, name)
    end

    def have_one(name)
      AssociationMatcher.new(:has_one, name)
    end

    def belong_to(name)
      AssociationMatcher.new(:belongs_to, name)
    end
    # rubocop:enable Style/PredicateName

    class AssociationMatcher

      attr_accessor :name, :macro, :actual, :options

      def initialize(macro, name)
        @macro = macro
        @name = name
        @options = {}
      end

      def serializer(serializer)
        @options[:serializer] = serializer
        self
      end

      def matches?(actual)
        @actual = actual
        association_exists? && macro_correct? && serializer_correct?
      end

      def description
        "#{macro} #{name}"
      end

      def failure_message
        if missing.blank?
          "Expected #{expectation}, but it did not"
        else
          "Expected #{expectation} (#{missing}), but it did not"
        end
      end

      def failure_message_when_negated
        "Did not expect #{expectation}, but it did"
      end

      protected

      attr_reader :missing

      def expectation
        "#{actual.inspect} to have a #{macro} association called #{name}"
      end

      def serializer_class
        if actual.is_a?(Class)
          actual
        else
          actual.class
        end
      end

      def reflections
        serializer_class._reflections
      end

      def reflection
        reflections.select do |reflection|

          reflection.name == name

        end.first
      end

      def association_exists?
        !reflection.nil?
      end

      def macro_correct?
        if reflection.macro == macro
          true
        else
          @missing = "actual association type was #{reflection.macro}"
          false
        end
      end

      def serializer_correct?
        return true unless options.key?(:serializer)
        expected_serializer = reflection.options[:serializer]
        if expected_serializer == options[:serializer]
          true
        else
          @missing = "#{name} should be serialize with #{expected_serializer}"
          false
        end
      end

    end
  end
end
