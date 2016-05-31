
class Oystercard
  attr_reader :balance

  def initialize
    @balance = DEFAULT_MIN
    @in_journey = false
  end
  
  def top_up(value)
    top_up_fail(value)
    @balance += value
  end
  
  def touch_in
    fail "Insufficient funds" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  private

  attr_reader :in_journey

  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 0
  MINIMUM_FARE = 1

  def top_up_fail(value)
    fail 'Please input an integer' unless is_number?(value)
    fail 'Exceeded limit' if limit?(value)
  end

  def deduct(value)
    deduct_fail(value)
    @balance -= value
  end
  
  def deduct_fail(value)
    fail "Please input an integer" unless is_number?(value)
    fail "Insufficient funds" if empty?(value)
  end

  def empty?(value)
    (@balance - value) < DEFAULT_MIN
  end

  def limit?(value)
    (@balance + value ) > DEFAULT_LIMIT
  end

  def is_number?(value)
    value.is_a? Integer
  end
end
