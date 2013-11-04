gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gschool/project'
require './lib/gschool/teammates'
require './lib/gschool/group'
require './lib/gschool/cohort'

module GSchool
  class CohortTest < Minitest::Test
    def test_simple_cohort
      cohort = Cohort.new(%w(Charlie Alice Bob), %w(alice charlie Bob))
      assert_equal [:Alice, :Bob, :Charlie], cohort.students
      assert_equal cohort.students, cohort.all
      assert_equal [:alice, :Bob, :charlie], cohort.usernames
    end

    def test_cohort_after_student_left
      cohort = Cohort.new(%w(Charlie Alice Bob), %w(alice charlie Bob), %w(Bob))
      assert_equal [:Alice, :Bob, :Charlie], cohort.students
      assert_equal [:Alice, :Charlie], cohort.all
    end

    def test_handles_nil_input
      cohort = Cohort.new(nil, nil)
      assert_equal [], cohort.students
      assert_equal [], cohort.usernames
    end

    def test_has_groups
      assert Cohort.new([]).respond_to?(:groups)
    end

    def test_teams
      cohort = Cohort.new(%w(Alice Bob Charlie Dave))
      data = {
        'name' => "mixtape",
        'teams' => [
          "Alice, Bob",
          "Charlie & Dave",
        ]
      }
      cohort.projects << Project.new(data)

      data = {
        'name' => "calorieado",
        'teams' => [
          "Bob, Charlie",
          "Alice & Dave"
        ]
      }
      cohort.projects << Project.new(data)

      expected = [
        [:Alice, :Bob],
        [:Alice, :Dave],
        [:Bob, :Charlie],
        [:Charlie, :Dave]
      ]
      assert_equal expected.sort, cohort.teams.sort
    end

    def test_teammates
      cohort = Cohort.new(%w(Alice Bob Charlie Dave))
      data = {
        'name' => "mixtape",
        'teams' => [
          "Alice, Bob",
          "Charlie & Dave",
        ]
      }
      cohort.projects << Project.new(data)

      data = {
        'name' => "calorieado",
        'teams' => [
          "Bob, Charlie",
          "Alice & Dave"
        ]
      }
      cohort.projects << Project.new(data)

      # Ignores duplicates
      data = {
        'name' => 'buy, burn, blah',
        'teams' => [
          'Dave, Alice'
        ]
      }
      cohort.projects << Project.new(data)

      expected = [
        [:Alice, :Bob],
        [:Alice, :Dave],
        [:Bob, :Charlie],
        [:Charlie, :Dave]
      ]

      assert_equal [:Bob, :Dave], cohort.teammates("Alice")
    end

    def test_cohort_from_yml
      cohort = Cohort.from_yml('./test/fixtures/students.yml')
      assert_equal [:Alice, :Bob, :Charlie, :Dave, :Eve, :Fred], cohort.students
      assert_equal [:alice, :bob, :charlie, :dave, :eve, :fred], cohort.usernames
      assert_equal [:Alice, :Charlie, :Dave, :Eve, :Fred], cohort.all

      assert_equal [:Bob, :Charlie, :Eve, :Fred], cohort.teammates("Alice")
    end
  end
end
