require "thread"

class Philosopher
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def eat
    puts "Philosopher #{id} is eating"
  end

  def done
    puts "mamma mia!"
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

p1 = Philosopher.new(1)
p2 = Philosopher.new(2)
p3 = Philosopher.new(3)
p4 = Philosopher.new(4)
p5 = Philosopher.new(5)

f1 = Fork.new(1)
f2 = Fork.new(2)
f3 = Fork.new(3)
f4 = Fork.new(4)
f5 = Fork.new(5)

arrangement = {
  p1: [f1, f2],
  p2: [f2, f3],
  p3: [f3, f4],
  p4: [f4, f5],
  p5: [f5, f1]
}

semaphore = Mutex.new
resource = ConditionVariable.new

t1 = Thread.new {
  loop do
    p1.eat
    semaphore.synchronize {
      resource.wait(semaphore)
      f1.in_use!
      f2.in_use!
      sleep(3)
      resource.signal
    }
    p1.done
    p1.think
  end
}

t2 = Thread.new {
  loop do
    p2.eat
    semaphore.synchronize {
      resource.wait(semaphore)
      f2.in_use!
      f3.in_use!
      sleep(5)
      resource.signal
    }
    p2.done
    p2.think
  end
}

t2.join
