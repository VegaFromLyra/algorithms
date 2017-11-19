# https://code.google.com/codejam/contest/4224486/dashboard#s=p1

load 'scheduler.rb'
require 'pry'

input_lines = File
  .readlines("input.txt")
  .map { |line| line.gsub(/\n/, "") }

number_of_test_cases = input_lines.first

test_cases = input_lines - [number_of_test_cases]

number_of_test_cases.to_i.times do |test_case_number|
  test_case_input = test_cases.take(2)
  test_cases = test_cases - test_case_input

  customer_number = test_case_input[0].split.last.to_i
  barber_times = test_case_input[1].split.map { |entry| entry.to_i }

  output = Scheduler
    .new(barber_times: barber_times)
    .find_barber(customer_number: customer_number)

  puts "Case #{test_case_number + 1}: #{output}"
end

