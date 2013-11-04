class Project
  attr_reader :name, :teams
  def initialize(name)
    @name = name
    @teams = []
  end

  def <<(team)
    @teams << normalize(team)
  end

  private

  def normalize(team)
    Array(team).each_with_object([]) do |names, groups|
      groups.concat names.split(/\s*[,&]\s*/).sort.map(&:intern)
    end
  end
end
