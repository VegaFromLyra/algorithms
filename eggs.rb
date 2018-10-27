#A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.

  #If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.

  #Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.

def highest_floor(number_of_floors)
  lowest_floor = 1
  highest_floor = number_of_floors

  while (lowest_floor + 1) < highest_floor
    middle_floor = (lowest_floor + highest_floor) / 2

    puts "Lowest floor: #{lowest_floor}"
    puts "Highest floor: #{highest_floor}"
    puts "Middle floor: #{middle_floor}"

    if egg_breaks?(middle_floor)
      highest_floor = middle_floor
    else
      lowest_floor = middle_floor
    end
  end

  if egg_breaks?(middle_floor)
    middle_floor -= 1
  end

  middle_floor
end

def egg_breaks?(floor)
  floor >= 9
end

