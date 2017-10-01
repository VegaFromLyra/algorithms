class Scheduler
  attr_reader :barber_times

  def initialize(barber_times:)
    @barber_times = barber_times
  end

  def find_barber(customer_number:)
    remaining_times = barber_times.clone
    customers = (1..barber_times.count).to_a

    next_customer = barber_times.count + 1

    barber = nil

    loop do
      barber = customers.find_index { |customer| customer == customer_number }
      break unless barber.nil?

      remaining_times.map! { |remaining| remaining -= 1 }

      remaining_times.each_with_index do |remaining, index|
        if remaining == 0
          remaining_times[index] = barber_times[index]
          customers[index] = next_customer
          next_customer += 1
        end
      end
    end

    barber + 1
  end
end
