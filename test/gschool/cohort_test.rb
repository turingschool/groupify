gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gschool/group'
require './lib/gschool/cohort'

module GSchool
  class CohortTest < Minitest::Test
    def test_simple_cohort
      cohort = Cohort.new(%w(Charlie Alice Bob), %w(alice charlie Bob))
      assert_equal [:"Alice", :"Bob", :"Charlie"], cohort.students
      assert_equal cohort.students, cohort.all
      assert_equal [:alice, :Bob, :charlie], cohort.usernames
    end

    def test_cohort_after_student_left
      cohort = Cohort.new(%w(Charlie Alice Bob), %w(alice charlie Bob), %w(Bob))
      assert_equal [:"Alice", :"Bob", :"Charlie"], cohort.students
      assert_equal [:"Alice", :"Charlie"], cohort.all
    end

    def test_students_from_yml
      cohort = Cohort.from_yml('./test/fixtures/students.yml')
      assert_equal [:"Alice", :"Bob", :"Charlie"], cohort.students
      assert_equal [:"alice", :"bob", :"charlie"], cohort.usernames
      assert_equal [:"Alice", :"Charlie"], cohort.all
    end

    def test_handles_nil_input
      cohort = Cohort.new(nil, nil)
      assert_equal [], cohort.students
      assert_equal [], cohort.usernames
    end

    def test_has_groups
      assert Cohort.new([]).respond_to?(:groups)
    end
  end
end
