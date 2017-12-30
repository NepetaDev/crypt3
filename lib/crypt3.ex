defmodule Crypt3 do
  @on_load :init
  @moduledoc """
  Documentation for Crypt3.
  """
  
  def init do
    :ok = :erlang.load_nif('./priv/nif', 0)
  end

  @doc """
  Encodes `pw` using `salt` with a crypt(3) implementation.

  ## Examples

      iex> Crypt3.crypt("aaaaaaaa", "aa")
      "aakcR08PK3l1o"

  """
  def crypt(_, _) do
    exit(:nif_library_not_loaded)
  end
end
