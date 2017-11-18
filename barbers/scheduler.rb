class Scheduler
  attr_reader :barber_times

  def initialize(barber_times:)
    @barber_times = barber_times
  end

  def find_barber(customer_number:)
    current_time = 0
    latest_customer = barber_times.count

    loop do
      current_time += skip_ahead(barber_times)

      barber_times.each_with_index do |barber_time, index|
        if current_time % barber_time == 0
          latest_customer += 1

          if latest_customer == customer_number
            return index + 1
          end
        end
      end
    end
  end

  def skip_ahead(collection)
    result = collection.sort.find do |number|
      collection.all? { |item| item % number == 0 }
    end

    result || 1
  end
end
