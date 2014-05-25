defmodule PrimeFactors do

  def largest_prime_factor(n) do
    generate(n) |> List.flatten |>  Enum.max
  end

  def generate(n) do
    generate(n, [], 2)
  end

  defp generate(n, prime_factors, candidate) when rem(n, candidate) == 0 do
    generate(div(n, candidate), [candidate, prime_factors], candidate)
  end

  defp generate(n, prime_factors, candidate) when n > 1 do
    generate(n, prime_factors, candidate + 1)
  end

  defp generate(_n, prime_factors, _candidate), do: prime_factors
end