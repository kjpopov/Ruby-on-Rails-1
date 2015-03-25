#!/usr/bin/env ruby

class Array
  def compress
    myarr = self
    result = []
    myarr.each do |el|
      el.each do |val|
        result.push(val) unless val.nil?
      end
    end
    result
  end
end

thearray = [[1, nil, nil, nil],
            [nil, 2, 5, nil],
            [6, nil, nil, 7],
            [nil, 3, nil, 4]]

p thearray.compress
