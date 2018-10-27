def highest_floor(number_of_floors)
  lowest_floor = 0
  highest_floor = number_of_floors - 1
  number_of_drops = 0

  loop do
    middle_floor = (lowest_floor + highest_floor) / 2

    if (middle_floor == lowest_floor) || (middle_floor == highest_floor)
      return (middle_floor + 1)
    else
      number_of_drops += 1

      puts "Drop: #{number_of_drops}"

      if egg_breaks?(middle_floor)
        highest_floor = middle_floor
      else
        lowest_floor = middle_floor
      end
    end
  end
end

def egg_breaks?(floor)
  floor >= 65
end

