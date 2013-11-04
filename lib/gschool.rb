require "gschool/version"
require "gschool/group"
require "gschool/project"
require "gschool/teammates"
require "gschool/cohort"
require "gschool/discuss"

module GSchool
  Zero = Cohort.from_yml(File.absolute_path('../data/gschool0.yml', __FILE__))
  One = Cohort.from_yml(File.absolute_path('../data/gschool1.yml', __FILE__))

  def self.teams_of(n)
    teams = current.teams_of(n).map do |names|
      names.join(', ')
    end
    md(teams)
  end

  def self.md(list)
    if list.first.is_a?(Array)
      list.map do |sub_list|
        to_markdown(sub_list)
      end.join("\n")
    else
      to_markdown(list)
    end
  end

  def self.to_markdown(list)
    s = ""
    list.each do |name|
      s << "* #{name}\n"
    end
    s
  end

  def self.current
    GSchool::One
  end

  def self.discuss
    GSchool::Discuss.new(GSchool::One.all)
  end
end
