class Scheduler
    attr_reader :barber_times

    def initialize(barber_times:)
      @barber_times = barber_times
    end

    def find_barber(n)
        if n <= barber_times.count
            n
        else
            calculate_barber(n)
        end
    end

    private

    def calculate_barber(n)
        done = false
        selected_barber = nil

        next_customer = n - barber_times.count
        current_barber_times = barber_times

        while next_customer > 0
            next_barber_index = current_barber_times.find_index { |barber_time| barber_time == 0 }

            if next_barber_index.nil?
                current_barber_times.map! { |barber_time| barber_time -= 1 }
            else
                next_customer -= 1
                current_barber_times[next_barber_index] = barber_times[next_barber_index]
            end
        end

        next_barber_index + 1
    end
end
