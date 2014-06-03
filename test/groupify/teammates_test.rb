gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/groupify/teammates'

module Groupify
  class TeammatesTest < Minitest::Test
    def test_stores_teammates
      mates = Teammates.new(:"Alice")
      mates << :"Bob"
      mates << :"Charlie"

      assert_equal [:"Bob", :"Charlie"], mates.to_a
    end

    def test_ignores_duplicates
      mates = Teammates.new(:"Alice")
      mates << :"Bob"
      mates << :"Bob"
      mates << :"Charlie"
      assert_equal [:"Bob", :"Charlie"], mates.to_a
    end

    def test_returns_in_alphabetical_order
      mates = Teammates.new(:"Alice")
      mates << :"Charlie"
      mates << :"Bob"

      assert_equal [:"Bob", :"Charlie"], mates.to_a
    end

    def test_ignores_original_student
      mates = Teammates.new(:"Alice")
      mates << :"Charlie"
      mates << :"Bob"
      mates << :"Alice"

      assert_equal [:"Bob", :"Charlie"], mates.to_a
    end

    def test_add_a_bunch_of_teammates_at_once
      mates = Teammates.new(:"Alice")
      mates << [:"Charlie", :"Bob"]

      assert_equal [:"Bob", :"Charlie"], mates.to_a
    end
  end
end
