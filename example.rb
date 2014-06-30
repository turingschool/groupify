$:.unshift File.expand_path('../lib', __FILE__)

require 'groupify'

# ==== Group students into teams of n ====
Groupify.current.teams_of(4).each do |team|
  puts team.join ', '
end

# ==== Group students for 1on1s ====
# num_instructors = 3
# start_time      = '14:00'
# duration        = 10 # minutes
# puts Groupify.one_on_ones(num_instructors, start_time, duration)

# ==== Randomized Students for retrospectives ====
# retro = Groupify.discuss
# while student_name = retro.next
#   puts student_name
# end
