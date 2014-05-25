require Integer

defmodule Problems do

  # Problem 1
  def multiples_sum(max) do
    Enum.filter(0..max, fn(x) -> rem(x, 3) == 0 || rem(x, 5) == 0 end)
    |> Enum.sum
  end

  # Problem 2
  def even_fibonaccis_sum(max) do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take_while(fn(x) -> x < max end)
    |> Enum.filter(fn(x)-> Integer.even?(x) end)
    |> Enum.sum
  end

  # Problem 3
  def largest_prime_factor(number) do
    PrimeFactors.largest_prime_factor(600851475143)
  end

end



