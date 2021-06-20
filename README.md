# Identicon

## Goal
To generate an itenticon unique to each string value (Enter)
![identicon2](https://user-images.githubusercontent.com/40097537/122680430-15d16280-d1bd-11eb-810a-9bc321158eea.JPG)

## Criteria
-An identicon is a 250px square made up of a 5x5 grid of squares, each 50 px tall and wide
-Identicon are always mirrored along the center vertical axis
-Each Identicon should not be randomly generated. They are generated based on a string input, so each specific string should consistently generate the exact same identicon

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

