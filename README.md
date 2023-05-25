# Google Place Coordinate Finder

Find the coordinates (latitude and longitude) using the [Places API](https://developers.google.com/maps/documentation/places/web-service/overview) for a given address.

## Usage

```elixir
iex> Find.coords("#$$$$$$")
{:error, %ElixirCL.Places.Find.Error{address: "#$$$$$$", code: "ZERO_RESULTS", message: "No results found"}}
```

```elixir
iex> Find.coords("La Moneda, Santiago")
{:ok, %ElixirCL.Places.Find.Coords{address: "La Moneda, Santiago", lat: -33.4429091, lon: -70.6538699}}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixircl_places_find` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixircl_places_find, github: "elixircl/placesfind"}
  ]
end
```

## Configuration
Be sure to add [Google Maps API Key](https://console.cloud.google.com/google/maps-apis/credentials) in `config/config.exs` or set `GOOGLE_MAPS_API_KEY` env.

See [Google Maps Elixir](https://github.com/sntran/google_maps) for more info.

## Credits

- Made with <i class="fa fa-heart">&#9829;</i> by <a href="https://ninjas.cl" target="_blank">Ninjas.cl</a>.

- Special Thanks To [@takakeiji](https://github.com/TakaKeiji)

