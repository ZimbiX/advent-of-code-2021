#!/usr/bin/env ruby

commands = File.read('day2-input.txt')
  .split("\n")
  .reduce({ horizontal_position: 0, depth: 0, aim: 0}) do |state, command|
    direction, distance = command.split(' ')
    distance = distance.to_i
    case direction
    when 'up'
      state.merge(
        aim: state[:aim] - distance,
      )
    when 'down'
      state.merge(
        aim: state[:aim] + distance,
      )
    when 'forward'
      state.merge(
        horizontal_position: state[:horizontal_position] + distance,
        depth: state[:depth] + state[:aim] * distance,
      )
    end
  end
  .tap(&method(:puts))
  .then { |horizontal_position:, depth:, **| puts horizontal_position * depth }
