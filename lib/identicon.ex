defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  main

  ## Examples

      iex> Identicon.main("Sebastian")

  """

  def main(input) do
    # At every stage in the pipeline below, we need to make sure we are producing a struct
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color) # Creating the color object that drawRectangle expects

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
      # This is a odd exception in erland where immutability doesn't apply, the same image is being updated
    end

    :egd.render(image)
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end
    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row(row) do
    [first, second | _tail] = row

    row ++ [second, first]
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # What happens in the argument list above is that it pulls using pattern matching the
    # -first 3 values of hex and assigning to variables r, g, b
    # Refactored the argument list above, look at notes https://www.notion.so/instinctvet/Structs-9cff25a613724d1bacc70a8a000a48c0#00eb8503caf144fdb76da6b51f2b60a1

    %Identicon.Image{image | color: {r, g, b}} # Updating a map using the pipe method
  end

  def hash_input(input) do
     hex = :crypto.hash(:md5, input)
     |> :binary.bin_to_list

     %Identicon.Image{hex: hex} # Assigning our hex to the Image struct
  end
end
