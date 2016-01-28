require './test_helper'

# Find the nth prime number

# Interview Class
class Interview
  def initialize
  end

  def find_prime(input)
    mem_primes = [nil, 2, 3, 5, 7]
    return mem_primes[input] if mem_primes[input]


    count = 7
    prime_count = 3
    last_prime = 2

    while(prime_count < input)
      if is_prime(count)
        last_prime = count
        prime_count += 1
      end

      count += 2
    end

    last_prime
  end

  def is_prime(n)
    return false if n < 2 || n % 2 == 0
    return true if n == 2

    count = 3
    square_root = Math.sqrt(n)

    while (count <= square_root)
      return false if n % count == 0
      count += 2
    end

    return true
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 17
    assert_equal(true, @interview.is_prime(input))
  end

  def test_two
    input = 20
    assert_equal(false, @interview.is_prime(input))
  end

  def test_three
    input = 5
    assert_equal(11, @interview.find_prime(input))
  end

  def test_four
    input = 7
    assert_equal(17, @interview.find_prime(input))
  end

  def test_five
    input = 1
    assert_equal(2, @interview.find_prime(input))
  end

  def test_six
    input = 64
    assert_equal(311, @interview.find_prime(input))
  end
end
