#!/usr/bin/env ruby

require 'amazing_print'

tallies =
  File.read('day3-input.txt')
    .split("\n")
    .map(&:chars)
    .transpose
    .map(&:tally)

%i[min_by max_by]
  .map do |side|
    tallies.map do |tally|
      tally.send(side, &:last)[0]
    end
      .join.to_i(2)
  end
  .reduce(:*)
  .then(&method(:puts))
