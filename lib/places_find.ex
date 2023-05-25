defmodule ElixirCL.Places.Find do
  @moduledoc """
  Documentation for `Findplace`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Findplace.hello()
      :world

  """
  def from(address, opts \\ []) when is_binary(address) and is_list(opts) do
    options = Keyword.merge([input: address, inputtype: "textquery", fields: "geometry/location"], opts)
    case GoogleMaps.get("place/findplacefromtext", options) do
      {:ok, %{"candidates" => [%{"location" => location} | _]} = response} -> {:ok, %{address: address, lat: location["lat"], lon: location["lng"], response: response}}
      response -> {:error, %{address: address, code: :PLACE_NOT_FOUND, response: response}}
    end
  end
end
