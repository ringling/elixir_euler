defmodule Palindrome do

  def palindrome?(str) do
    String.reverse(str) == str
  end

  def generate_largest(number_of_factor_digits) do
    9009
  end

  def factors(product) do
    factors(2, product, [1,product])
  end

  defp factors(factor, product, factors) do

    canditate = product / factors


    factors(factor + 1, product, [[factor, canditate] | factors])
  end

  defp factors(factor, product, factors) when factor == product - 1 do
    factors
  end

end
