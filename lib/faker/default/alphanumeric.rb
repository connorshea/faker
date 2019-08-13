# frozen_string_literal: true

module Faker
  class Alphanumeric < Base
    class << self
      ##
      # List of characters allowed for alphabetic strings
      # @private
      ALPHABET = ('a'..'z').to_a

      ##
      # List of characters allowed for alphanumeric strings
      # @private
      ALPHANUMS = ALPHABET + (0..9).to_a

      ##
      # Produces a random string of alphabetic characters (no digits)
      #
      # @param number [Integer] The length of the string to generate
      #
      # @return [String]
      #
      # @example
      #   Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"
      #
      # @faker.version 1.9.2
      def alpha(number: 32)
        char_count = resolve(number)
        return '' if char_count.to_i < 1

        Array.new(char_count) { sample(ALPHABET) }.join
      end

      ##
      # Produces a random string of alphanumeric characters
      #
      # @param number [Integer] The length of the string to generate
      #
      # @return [String]
      #
      # @example
      #   Faker::Alphanumeric.alpha(number: 10) #=> "3yfq2phxtb"
      #
      # @faker.version 1.9.2
      def alphanumeric(number: 32)
        char_count = resolve(number)
        return '' if char_count.to_i < 1

        Array.new(char_count) { sample(ALPHANUMS) }.join
      end
    end
  end
end
