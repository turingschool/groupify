require 'time'
class Schedule
  attr_reader :names, :start_time, :duration
  def initialize(names, time, duration)
    @names = names
    @start_time = Time.strptime(time, "%H:%M")
    @duration = duration*60
  end

  def appointments
    names.map.with_index do |name, i|
      "%s %s" % [slot(i), name]
    end
  end

  private

  def slot(i)
    (start_time + (i*duration)).strftime('%H:%M')
  end
end
