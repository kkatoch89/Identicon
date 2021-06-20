## Description

An app that generates an identicon unique to each string value (Space, Space, Enter)
![identicon2](https://user-images.githubusercontent.com/40097537/122680430-15d16280-d1bd-11eb-810a-9bc321158eea.JPG)

## Acceptance Criteria

- [x] An identicon is a 250px square made up of a 5x5 grid of squares, each 50 px tall and wide
- [x] Identicon are always mirrored along the center vertical axis
- [x] Each Identicon should not be randomly generated. They are generated based on a string input, so each specific string should consistently generate the exact same identicon

## Type of Changes

<!-- Put an `✓` for the applicable box: -->

|     | Type                       |
| --- | -------------------------- |
|  ✓ | :sparkles: New feature     |
|  ✓ | :link: Update dependencies |
|  ✓ | :scroll: Docs              |


### Demo

![identiconDemo](https://user-images.githubusercontent.com/40097537/122688182-c6089080-d1e8-11eb-8350-407c41123e37.gif)

## Setup

- Add the following dependency to `mix.exs` file
```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```
- To update deps, run following commands while in directory
  - `mix deps.clean --all`
  - `mix deps.get`
  - `mix deps.compile`
- Compile and run app using `iex -S mix`
