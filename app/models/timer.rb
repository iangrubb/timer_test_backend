class Timer < ApplicationRecord

    def play

        self.update(running: true)

        projected = DateTime.now + (self.seconds_remaining / 86400)

        self.update(completion_time: projected)


        previous_remaining = projected.to_f - DateTime.now.to_f

        while self.running do

            remaining = projected.to_f - DateTime.now.to_f

            if previous_remaining.floor != remaining.floor
                puts previous_remaining.floor
            end

            previous_remaining = remaining

            if DateTime.now > self.completion_time
                puts "Done!"
                self.update(running: false)
                self.update(seconds_remaining: 0.0)
            end

            self.reload

        end

        if self.seconds_remaining > 0.0
            self.update(seconds_remaining: remaining)
        end

        puts self.seconds_remaining

    end

    def pause

        self.update(running: false)

    end



end
