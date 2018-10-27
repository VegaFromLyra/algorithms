def highest_floor(number_of_floors)
  lowest_floor = 1
  highest_floor = number_of_floors
  number_of_drops = 0

  while (lowest_floor + 1) < highest_floor
    puts "Lowest floor: #{lowest_floor}"
    puts "Highest floor: #{highest_floor}"

    middle_floor = (lowest_floor + highest_floor) / 2

    number_of_drops += 1

    puts "Drop from #{middle_floor}: #{number_of_drops}"

    if egg_breaks?(middle_floor)
      highest_floor = middle_floor
    else
      lowest_floor = middle_floor
    end
  end

  middle_floor
end

def egg_breaks?(floor)
  floor >= 65
end

