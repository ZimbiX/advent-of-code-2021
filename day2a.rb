#!/usr/bin/env ruby

commands = File.read('day2-input.txt')
  .split("\n")
  .map { |line| line.split(' ') }

forward = commands.select { |direction, distance| direction == 'forward' }
down    = commands.select { |direction, distance| direction == 'down' }
up      = commands.select { |direction, distance| direction == 'up' }

horizontal_position = forward.sum { |direction, distance| distance.to_i }
depth               =    down.sum { |direction, distance| distance.to_i } -
                           up.sum { |direction, distance| distance.to_i }

puts horizontal_position * depth
