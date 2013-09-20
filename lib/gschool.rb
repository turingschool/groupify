require "gschool/version"
require "gschool/group"
require "gschool/discuss"
require "gschool/zero"
require "gschool/one"

module GSchool

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
    GSchool::One.all
  end

  def self.discuss
    GSchool::Discuss.new(GSchool::One.all)
  end
end
