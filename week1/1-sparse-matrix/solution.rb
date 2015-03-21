#!/usr/bin/env ruby

thearray = [[1, nil, nil, nil],
            [nil, 2, 5, nil],
            [6, nil, nil, 7],
            [nil, 3, nil, 4]]

result = []

thearray.each do |el|
  el.each do |val|
    result.push(val) unless val.nil?
  end
end

p result
