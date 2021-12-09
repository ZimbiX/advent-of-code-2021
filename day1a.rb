#!/usr/bin/env ruby

File.read('day1-input.txt')
  .split("\n")
  .map(&:to_i)
  .each_cons(2)
  .count { |a, b| a < b }
  .then(&method(:puts))
