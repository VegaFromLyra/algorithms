require "thread"
require "pry"

class Philosopher
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def eat
    puts "Philosopher #{id} is eating"
  end

  def done
    puts "Philosopher #{id} is done! Mamma mia!"
  end

  def think
    puts "Philosopher #{id} is thinking"
  end
end

class Fork
  attr_reader :id, :in_use

  def initialize(id)
    @id = id
  end

  def in_use!
    @in_use = true
  end
end

def process(n)
  philosophers = []
  forks = []

  n.times do |counter|
    philosophers << Philosopher.new(counter + 1)
    forks << Fork.new(counter + 1)
  end

  arrangement = arrange(philosophers, forks)

  mutex = Mutex.new
  resource = ConditionVariable.new

  t1 = Thread.new {
    mutex.synchronize {
      resource.wait(mutex)
      puts "p1 is eating"
      forks[0].in_use!
      forks[1].in_use!
      philosophers[0].eat
      sleep(1)
    }
    philosophers[0].done
    philosophers[0].think
  }

  t2 = Thread.new {
    mutex.synchronize {
      forks[1].in_use!
      forks[2].in_use!
      philosophers[1].eat
      sleep(1)
      resource.signal
    }
    philosophers[1].done
    philosophers[1].think
  }

  t1.join
  t2.join
end

def arrange(philosophers, forks)
  counter = 0
  philosophers.inject({}) do |memo, p|
    memo[p] = [forks[counter], forks[(counter + 1) % forks.count]]
    counter += 1
    memo
  end
end

process(5)
