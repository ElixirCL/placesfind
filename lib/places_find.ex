defmodule ElixirCL.Places.Find do

  defmodule Error do
    defstruct ~w(address code message)a
    def new(address, code, message), do: %ElixirCL.Places.Find.Error{address: address, code: code, message: message}
  end

  defmodule Coords do
    defstruct ~w(address lat lon)a
    def new(address, lat, lon), do: %ElixirCL.Places.Find.Coords{address: address, lat: lat, lon: lon}
  end

  @moduledoc """
  Documentation for `ElixirCL.Places.Find`.
  """

  @doc """
  Find the coordinates (latitude and longitude) using the [Places API](https://developers.google.com/maps/documentation/places/web-service/overview)
  for a given address.

  ## Examples

      iex> Find.coords("#$$$$$$")
      {:error, %ElixirCL.Places.Find.Error{address: "#$$$$$$", code: "ZERO_RESULTS", message: "No results found"}}

      iex> Find.coords("La Moneda, Santiago")
      {:ok, %ElixirCL.Places.Find.Coords{address: "La Moneda, Santiago", lat: -33.4429091, lon: -70.6538699}}

  """
  def coords(address, opts \\ []) when is_binary(address) and is_list(opts) do
    options = Keyword.merge([input: address, inputtype: "textquery", fields: "geometry/location"], opts)
    case GoogleMaps.get("place/findplacefromtext", options) do
      {:ok, %{"candidates" => [%{"geometry" => %{"location" => location}} | _]} = _response} -> {:ok, Coords.new(address, location["lat"], location["lng"])}
      {:error, code, message} -> {:error, Error.new(address, code, message)}
      {:error, "ZERO_RESULTS" = code} -> {:error, Error.new(address, code, "No results found")}
      error -> error
    end
  end
end
