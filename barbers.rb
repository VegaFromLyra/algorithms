class Scheduler
    attr_reader :barber_times

    def initialize(barber_times:)
      @barber_times = barber_times
    end

    def find_barber(customer_number:)
        if customer_number <= barber_times.count
            customer_number
        else
            calculate_barber(customer_number)
        end
    end

    private

    def calculate_barber(customer_number)
        next_customer = barber_times.count + 1
        current_barber_times = barber_times.clone
        selected_barber = nil

        while next_customer <= customer_number
            available_barbers = calculate_available_barbers(current_barber_times)

            available_barbers.each do |current_barber|
                if next_customer == customer_number
                    selected_barber = current_barber
                end

                next_customer += 1

                current_barber_times[current_barber] = barber_times[current_barber]
            end

            current_barber_times.map! { |barber_time| barber_time -= 1 }
        end

        selected_barber + 1
    end

    def calculate_available_barbers(current_barber_times)
        result = []

        current_barber_times.each_with_index do |barber_time, index|
            result << index if barber_time == 0
        end

        result
    end
end