gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/gschool/project'

class ProjectTest < Minitest::Test
  # The teams can be added in various formats.
  # The team members are sorted.
  # The team members are stored as symbols.
  def test_add_teams
    project = Project.new("Mixtape")
    project << ["Alice Smith", "Bob Jones"]
    project << "Dave Ritchie & Charlie Baker"
    project << "Fred Burrough, Eve Forrest"

    expected = [
      [:"Alice Smith", :"Bob Jones"],
      [:"Charlie Baker", :"Dave Ritchie"],
      [:"Eve Forrest", :"Fred Burrough"],
    ]
    assert_equal expected, project.teams
  end
end

