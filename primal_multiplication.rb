require 'minitest/autorun'

class MultiplyPrimes
  def first_n_primes(n)
    primes = []
    upper_limit = (Math.sqrt(n) * n).ceil
    integers = (2..upper_limit)

    while primes.length < n
      prime = integers.first
      primes << prime
      integers = integers.reject{|i| i % prime == 0 }
    end

    primes
  end

  def print_product_table(numbers)
    result = '  ' + numbers.join(' ') + "\n"
    numbers.each do |number|
      result << number.to_s + '| ' + numbers.map {|n| n * number }.join(' ') + "\n"
    end

    result
  end
end

class MultiplyPrimesTest < Minitest::Test
  def test_first_n_primes
    primes = MultiplyPrimes.new

    assert_equal([], primes.first_n_primes(0))
    assert_equal([2], primes.first_n_primes(1))
    assert_equal([2,3,5,7,11,13,17,19,23,29], primes.first_n_primes(10))
  end

  def test_print_product_table
    primes = MultiplyPrimes.new
    ten_primary_table = primes.print_product_table(primes.first_n_primes(10))

    assert_includes(ten_primary_table, '2 3 5 7 11')
    assert_includes(ten_primary_table, '4 6 10 14 22 26 34 38 46 58')
    assert_includes(ten_primary_table, '29| 58')

    print ten_primary_table
  end
end
