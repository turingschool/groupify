class Project
  attr_reader :name, :teams
  def initialize(data)
    @name = data['name']

    @teams = []
    (data['teams'] || []).each do |names|
      @teams << normalize(names)
    end
  end

  private

  def normalize(team)
    Array(team).each_with_object([]) do |names, groups|
      groups.concat names.split(/\s*[,&]\s*/).sort.map(&:intern)
    end
  end
end
