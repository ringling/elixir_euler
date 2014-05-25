defmodule Factors do

  def factors(product) do
    Enum.chunk(factors(1, product, [], true),2)
  end

  def factors(product, digits) do
    res = factors(product)

    min = get_min_integer(digits) - 1
    max = get_min_integer(digits) * 10

    Enum.filter(res,
      fn(x) ->
        [a,b] = x
        a > min && a < max && b > min && b < max
    end)
  end

  defp factors(_factor, _product, factors, false) do
    [ _a, _b | res] = factors
    res
  end

  defp factors(factor, product, factors, true) when rem(product, factor) == 0 do
    list = add_to_list(product, factor, factors)
    [ a, b | _list] = list
    factors(factor + 1, product, list, b >= a)
  end

  defp factors(factor, product, factors, true) do
    factors(factor + 1, product, factors, true)
  end

  def add_to_list(product, factor, factors) do
    List.flatten [[factor, round(product / factor)] | factors]
  end

  defp get_min_integer(digits) do
    {int, _rest } = Integer.parse Enum.map_join(1..digits, fn(x)-> if x>1, do: 0, else: 1 end)
    int
  end

end