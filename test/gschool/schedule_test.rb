gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gschool/schedule'

module GSchool
  class ScheduleTest < Minitest::Test
    def test_simple_schedule
      names = %w(Alice Bob Charlie)
      schedule = Schedule.new(names, '12:00', 40)
      expected = [
        "12:00 Alice",
        "12:40 Bob",
        "13:20 Charlie"
      ]
      assert_equal expected, schedule.appointments
    end
  end
end
