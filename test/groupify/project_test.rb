gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/groupify/project'

module Groupify
  class ProjectTest < Minitest::Test
    def test_initialize_with_teams
      data = {
        'name' => 'calorieado',
        'teams' => [
          "Alice Smith, Bob Jones",
          "Dave Ritchie & Charlie Baker",
          "Fred Burrough, Eve Forrest"
        ]
      }

      project = Project.new(data)
      expected = [
        [:"Alice Smith", :"Bob Jones"],
        [:"Charlie Baker", :"Dave Ritchie"],
        [:"Eve Forrest", :"Fred Burrough"],
      ]
      assert_equal expected, project.teams
    end
  end
end
