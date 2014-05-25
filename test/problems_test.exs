
defmodule ProblemsTest do
  use ExUnit.Case


  # Problem 1
  test "sum of multiples by 3 or 5" do
    assert Problems.multiples_sum(9) == 23
    assert Problems.multiples_sum(999) == 233168
  end

  # Problem 2
  test "sum of even fibonacci numbes" do
    assert Problems.even_fibonaccis_sum(89) == 44
    assert Problems.even_fibonaccis_sum(4000000) == 4613732
  end

  # Problem 3
  test "largest prime factor" do
    assert PrimeFactors.largest_prime_factor(13195) == 29
    assert PrimeFactors.largest_prime_factor(600851475143) == 6857
  end

  # Problem 4
  test "is palindrome" do
    assert Palindrome.palindrome?(to_string 9009) == true
    assert Palindrome.palindrome?(to_string 90009) == true
    assert Palindrome.palindrome?("ababa") == true
  end

  test "largest palindrome made from the product of two n-digit numbers" do
    IO.inspect Palindrome.factors(25)

    # assert Palindrome.generate_largest(20) == 29
    # assert Palindrome.largest_prime_factor(600851475143) == 6857
  end

end