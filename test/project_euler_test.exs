defmodule ProjectEulerTest do
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
    assert 9009 |> to_string |> Palindrome.palindrome? == true
    assert 90009 |> to_string |> Palindrome.palindrome? == true
    assert "ababa" |> to_string |> Palindrome.palindrome? == true
  end

  test "largest palindrome made from the product of two n-digit numbers" do
    # assert Palindrome.plargest(3) == [1906, 906609]
    assert Palindrome.plargest(2) == [190, 9009]
  end
end

