defmodule Palindrome do

  def palindrome?(str) do
    String.reverse(str) == str
  end

  def largest(number_of_factor_digits) do
    min = get_min_integer(number_of_factor_digits)
    max = get_min_integer(number_of_factor_digits) * 10 -1

    a = min * min
    b = max * max

    Enum.max Enum.map(b..a,
      fn(x) ->
        x |> to_string |> palindrome? |> max_factor_sum x, number_of_factor_digits
      end
    )
  end

  def plargest(number_of_factor_digits) do
    me = self
    min = get_min_integer(number_of_factor_digits)
    max = get_min_integer(number_of_factor_digits) * 10 -1

    a = min * min
    b = max * max

    b..a
    |>
    Enum.map(fn(x) ->
      # if palindrome?(to_string x) do
        spawn_link fn -> (send me, {self, max_factor_sum(palindrome?(to_string x), x, number_of_factor_digits) }) end
      # else
      #   #Wait
      #   spawn_link fn -> (send me, {self, max_factor_sum(false, x, number_of_factor_digits) }) end
      #   IO.puts x
      # end
    end)
    |>
    Enum.map(fn (pid) ->
      receive do
        { ^pid, result } ->
          result
      end
    end)
    |>
    Enum.max
  end

  defp max_factor_sum(false, str, number_of_factor_digits) do
    [0, str]
  end

  defp max_factor_sum(true, str, number_of_factor_digits) do
    factors = Factors.factors(str, number_of_factor_digits)
    if length(factors) > 0 do
      [Enum.max(Enum.map(factors, fn(x) -> [a,b] = x; a + b end)), str]
    else
      [0, str]
    end
  end

  defp get_min_integer(digits) do
    {int, _rest } = Integer.parse Enum.map_join(1..digits, fn(x)-> if x>1, do: 0, else: 1 end)
    int
  end

end

defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
    |>
    Enum.map(fn (elem) ->
      spawn_link fn -> (send me, { self, fun.(elem) }) end
    end)
    |>
    Enum.map(fn (pid) ->
      receive do { ^pid, result } -> result end
    end)
  end
end